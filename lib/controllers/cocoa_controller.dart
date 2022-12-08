import 'package:bapways_integrated_system/components/common/app_notification_desktop.dart';
import 'package:bapways_integrated_system/controllers/client_controller.dart';
import 'package:bapways_integrated_system/db/db_helper.dart';
import 'package:bapways_integrated_system/models/cocoa_distribution.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:realm/realm.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CocoaController extends GetxController {
  final addCocoaDistributionFormKey = GlobalKey<FormState>();
  final GlobalKey<SfDataGridState> cocoaDataKey = GlobalKey<SfDataGridState>();
  final ClientController clientController = Get.find<ClientController>();

  late TextEditingController farmerIdController;
  late TextEditingController clientNameController;
  late TextEditingController kgToCompanyController;
  late TextEditingController kgToClientController;
  late TextEditingController dateOfSaleController;

  // OBSERVABLES
  var index = 0.obs;
  var isLoading = false.obs;
  var isEditing = false.obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;

  var errorMap = <String, dynamic>{"isError": false, "errorMessage": ''}.obs;
  final _cocoaDistributionList = <CocoaDistribution>[].obs;

  List<CocoaDistribution> get cocoaDistributionList => _cocoaDistributionList;

  // OFFICER TO EDIT
  late CocoaDistribution cocoaDataToEdit;

  //late Client selectedClient;

  // FORM DATA
  String farmerId = '';
  String clientName = '';
  String kgToCompany = '';
  String kgToClient = '';
  String dateOfSale = '';
  var selectedClientId = ''.obs;

  // FORM VALIDATION
  String? validate(String value, String header) {
    if (value.trim().isEmpty) {
      return '$header is required';
    }
    return null;
  }

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

  void _doneAndRefresh() {
    addCocoaDistributionFormKey.currentState!.reset();
    selectedClientId.value = '';
    getAllCocoaData();
  }

  // ASSIGN DATA TO UPDATE
  void assignCocoaDataToEdit(String id) {
    cocoaDataToEdit = _cocoaDistributionList.firstWhere(
      (data) => data.id.toString() == id,
    );
  }

//FETCH ALL DATA FROM THE DATABASE

  Future<void> getAllCocoaData() async {
    try {
      List<CocoaDistribution>? query = await DbHelper.getAllCocoaData();
      if (query != null) {
        _cocoaDistributionList.assignAll(query);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//ADD NEW DATA TO THE DATABASE
  Future<void> addCocoaData(BuildContext context) async {
    if (addCocoaDistributionFormKey.currentState!.validate()) {
      addCocoaDistributionFormKey.currentState!.save();

      try {
        CocoaDistribution cocoaData = CocoaDistribution(
          ObjectId(),
          selectedClientId.toString(),
          clientName,
          kgToCompany,
          kgToClient,
          DateFormat.yMMMEd().format(selectedDate.value).toString(),
          DateTime.now(),
        );

        DbHelper.insertCocoaData(cocoaData: cocoaData);
        AppNotificationDesktop.success(
          context: context,
          message: '$clientName created successfully',
        );
        _doneAndRefresh();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

//UPDATE DATA IN THE DATABASE
  Future<void> updateCocoaData() async {
    if (addCocoaDistributionFormKey.currentState!.validate()) {
      addCocoaDistributionFormKey.currentState!.save();

      try {
        CocoaDistribution dataToEdit = _cocoaDistributionList.firstWhere(
          (data) => data.id.toString() == cocoaDataToEdit.id.toString(),
        );
        CocoaDistribution cocoaData = CocoaDistribution(
          dataToEdit.id,
          selectedClientId.toString(),
          clientName,
          kgToCompany,
          kgToClient,
          DateFormat.yMMMEd().format(selectedDate.value).toString(),
          dataToEdit.createdAt,
        );

        DbHelper.updateCocoaData(cocoaData: cocoaData);
        _doneAndRefresh();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

// DELETE DATA
  Future<void> deleteCocoaData(CocoaDistribution cocoaData) async {
    try {
      await DbHelper.deleteCocoaData(cocoaData: cocoaData);
      getAllCocoaData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    farmerIdController = TextEditingController();
    clientNameController = TextEditingController();
    kgToCompanyController = TextEditingController();
    kgToClientController = TextEditingController();
    dateOfSaleController = TextEditingController();
    getAllCocoaData();
  }

  @override
  void onReady() {
    isEditing(false);
  }
}
