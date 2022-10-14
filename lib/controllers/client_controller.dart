import 'dart:convert';

import 'package:bapways_integrated_system/models/client.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import '../constants/api_url.dart';
import '../services/api_service.dart';

class ClientController extends GetxController {
  final ApiService _apiService = ApiService();

  final addClientFormKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  late TextEditingController districtController;
  late TextEditingController farmSizeController;
  late TextEditingController dateOfRegistrationController;

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
  var errorMap = <String, dynamic>{"isError": false, "errorMessage": ''}.obs;
  var clientsList = <Client>[].obs;

  // CLIENT TO EDIT
  late Client clientToEdit;

  void assignClientToEdit(int id) {
    clientToEdit = clientsList.firstWhere((client) => client.id == id);
  }

  // FORM DATA

  String name = '';
  String phone = '';
  String location = '';
  String district = '';
  String farmSize = '';
  String dateOfRegistration = '';

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

  //FETCH ALL CLIENTS
  Future<void> getClientsList() async {
    isLoading(true);
    Response response = await _apiService.getData(uri: ApiUrl.getClients);

    if (response.statusCode == 200) {
      clientsList.value = [];
      var json = jsonDecode(response.bodyString!) as List;
      List<Client> clients = json.map((o) => Client.fromMap(o)).toList();
      clientsList.addAll(clients);
      errorMap["isError"] = false;
      errorMap["errorMessage"] = '';
      isLoading(false);
    } else {
      //TODO: Work on The Error Display
      errorMap["isError"] = true;
      errorMap["errorMessage"] = response.statusText;
      isLoading(false);
    }

    update();
  }

  // ADD CLIENT TO THE DATABASE
  void addClient() async {
    if (addClientFormKey.currentState!.validate()) {
      addClientFormKey.currentState!.save();

      final Client client = Client(
        name: name,
        phone: phone,
        gender: genderValue.toString(),
        cropType: cropTypeValue.toString(),
        farmSize: farmSize,
        location: location,
        district: district,
        dateOfRegistration: dateOfRegistration,
        officerId: int.parse(registeredBy.value),
      );

      var clientJson = clientToJson(client);

      clientsList.add(client);

      try {
        final Response response = await _apiService.postData(
            uri: ApiUrl.postClients, body: clientJson);
        if (response.statusCode == 200) {
          //TODO: send a snackbar or toast to the user
          debugPrint('Successfully Posted to the Database');

          getClientsList();

          addClientFormKey.currentState!.reset();
          genderValue.value = '';
          cropTypeValue.value = '';
          registeredBy.value = '';
        }
      } catch (e) {
        //TODO: send a snackbar or toast to the user
        debugPrint(e.toString());
      }

      update();
    }
  }

// UPDATE A CLIENT
  Future<void> updateClient(int id) async {
    if (addClientFormKey.currentState!.validate()) {
      addClientFormKey.currentState!.save();

      List<Client> updatedItem =
          clientsList.where((data) => data.id == id).toList();

      final Client client = Client(
        name: name,
        phone: phone,
        gender: genderValue.toString(),
        cropType: cropTypeValue.toString(),
        farmSize: farmSize,
        location: location,
        district: district,
        dateOfRegistration: dateOfRegistration,
        officerId: int.parse(registeredBy.value),
      );

      updatedItem[0] = client;

      var clientJson = clientToJson(client);

      try {
        final Response response = await _apiService.updateData(
            uri: '${ApiUrl.updateClient}/$id', body: clientJson);
        if (response.statusCode == 200) {
          //TODO: send a snackbar or toast to the user
          debugPrint('Successfully Updated the Entry');

          getClientsList();

          addClientFormKey.currentState!.reset();
          genderValue.value = '';
          cropTypeValue.value = '';
          registeredBy.value = '';
        }
      } catch (e) {
        //TODO: send a snackbar or toast to the user
        debugPrint(e.toString());
      }

      update();
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
    dateOfRegistrationController = TextEditingController();

    getClientsList();
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
    dateOfRegistrationController.dispose();
  }
}
