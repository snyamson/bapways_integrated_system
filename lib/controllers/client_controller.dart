import 'package:bapways_integrated_system/controllers/officer_controller.dart';
import 'package:bapways_integrated_system/db/db_helper.dart';
import 'package:bapways_integrated_system/schema/schema.dart';
import 'package:bapways_integrated_system/utils/generate_ids.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:realm/realm.dart';

class ClientController extends GetxController {
  final OfficerController _officerController = Get.find<OfficerController>();

  final addClientFormKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  late TextEditingController districtController;
  late TextEditingController farmSizeController;

  // LIST VALUES
  final cropTypes = ['Cocoa', 'Maize', 'Rice', 'Vegetables'];
  final gender = ['Male', 'Female'];

// OBSERVABLES
  var genderValue = ''.obs;
  var cropTypeValue = ''.obs;
  var registeredBy = ''.obs;
  var index = 0.obs;
  var isLoading = false.obs;
  var isEditing = false.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  var errorMap = <String, dynamic>{"isError": false, "errorMessage": ''}.obs;
  final _clientsList = <Client>[].obs;

  List<Client> get clientsList => _clientsList;

  // CLIENT TO EDIT
  late Client _clientDataToEdit;

  Client get clientDataToEdit => _clientDataToEdit;

  // FORM DATA

  String name = '';
  String phone = '';
  String location = '';
  String district = '';
  String farmSize = '';

  // TAB MANAGEMENT
  void onPageChange(int newIndex) {
    index.value = newIndex;
  }

  // FORM EDITING CODES
  void startEditing() {
    isEditing(true);
  }

  void doneEditing() {
    isEditing(false);
  }

  // FORM VALIDATIONS
  String? validate(String value, String header) {
    if (value.trim().isEmpty) {
      return '$header is required';
    }
    return null;
  }

  // CLEAR INPUTS FIELDS AND REFRESH DATA

  void _doneAndRefresh() {
    addClientFormKey.currentState!.reset();
    genderValue.value = '';
    cropTypeValue.value = '';
    registeredBy.value = '';
    getAllClientData();
  }

  // ASSIGN DATA TO UPDATE
  void assignClientDataToEdit(String id) {
    _clientDataToEdit = _clientsList.firstWhere(
      (data) => data.id.toString() == id,
    );
  }

//FETCH ALL DATA FROM THE DATABASE

  Future<void> getAllClientData() async {
    try {
      List<Client>? query = await DbHelper.getAllClientData();
      if (query != null) {
        _clientsList.assignAll(query);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//ADD NEW DATA TO THE DATABASE
  Future<void> addClient() async {
    if (addClientFormKey.currentState!.validate()) {
      addClientFormKey.currentState!.save();

      try {
        Officer registeredByOfficer =
            _officerController.officersList.firstWhere(
          (officer) => officer.id.toString() == registeredBy.value,
        );

        Client client = Client(
          ObjectId(),
          GenerateId.assignClientId((_clientsList.length) + 1),
          name,
          phone,
          genderValue.toString(),
          cropTypeValue.toString(),
          farmSize,
          location,
          district,
          DateFormat.yMMMEd().format(selectedDate.value).toString(),
          DateTime.now(),
          officer: registeredByOfficer,
        );

        DbHelper.insertClientData(clientData: client);
        _doneAndRefresh();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

//UPDATE DATA IN THE DATABASE
  Future<void> updateClientData() async {
    if (addClientFormKey.currentState!.validate()) {
      addClientFormKey.currentState!.save();

      try {
        Client dataToEdit = _clientsList.firstWhere(
          (data) => data.id.toString() == _clientDataToEdit.id.toString(),
        );

        Officer registeredByOfficer =
            _officerController.officersList.firstWhere(
          (officer) => officer.id.toString() == registeredBy.value,
        );

        Client client = Client(
          dataToEdit.id,
          dataToEdit.clientId,
          name,
          phone,
          genderValue.toString(),
          cropTypeValue.toString(),
          farmSize,
          location,
          district,
          DateFormat.yMMMEd().format(selectedDate.value).toString(),
          dataToEdit.createdAt,
          officer: registeredByOfficer,
        );

        DbHelper.updateClientData(clientData: client);
        _doneAndRefresh();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    locationController = TextEditingController();
    districtController = TextEditingController();
    farmSizeController = TextEditingController();

    getAllClientData();
  }

  @override
  void onReady() {
    isEditing(false);
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    locationController.dispose();
    districtController.dispose();
    farmSizeController.dispose();
  }
}
