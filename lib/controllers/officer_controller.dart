import 'package:bapways_integrated_system/components/common/app_notification_desktop.dart';
import 'package:bapways_integrated_system/db/db_helper.dart';
import 'package:bapways_integrated_system/schema/schema.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm/realm.dart';

class OfficerController extends GetxController with StateMixin<List> {
//  final ApiService _apiService = ApiService();

  final addOfficerFormKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController locationController;
  late TextEditingController dateOfEmploymentController;

// LIST VALUES
  final values = ['Blue', 'Green', 'Red'];
  final gender = ['Male', 'Female'];
  final eduCert = ['Degree', 'Diploma', 'Certificate', 'Other'];

// OBSERVABLES
  var comboValue = ''.obs;
  var genderValue = ''.obs;
  var eduCertValue = ''.obs;
  var index = 0.obs;
  var isLoading = false.obs;
  var isEditing = false.obs;
  var errorMap = <String, dynamic>{"isError": false, "errorMessage": ''}.obs;
  final _officersList = <Officer>[].obs;

  RxList<Officer> get officersList => _officersList;

  // OFFICER TO EDIT
  late Officer _officerDataToEdit;

  Officer get officerDataToEdit => _officerDataToEdit;

// FORM DATA
  String dateOfEmployment = '';
  String name = '';
  String phone = '';
  String email = '';
  String location = '';

// FORM VALIDATIONS
  String? validate(String value, String header) {
    if (value.trim().isEmpty) {
      return '$header is required';
    }
    return null;
  }

  String? validateEmail(String value, String header) {
    if (value.trim().isEmpty) {
      return '$header is required';
    } else if (!GetUtils.isEmail(value)) {
      return '$header is not valid';
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

  // CLEAR INPUTS FIELDS AND REFRESH DATA

  void _doneAndRefresh() {
    addOfficerFormKey.currentState!.reset();
    genderValue.value = '';
    eduCertValue.value = '';
    getAllOfficerData();
  }

  // ASSIGN DATA TO UPDATE
  void assignOfficerDataToEdit(String id) {
    _officerDataToEdit = _officersList.firstWhere(
      (data) => data.id.toString() == id,
    );
  }

  //FETCH ALL DATA FROM THE DATABASE

  Future<void> getAllOfficerData() async {
    try {
      List<Officer>? query = await DbHelper.getAllOfficerData();

      if (query != null) {
        _officersList.assignAll(query);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//ADD NEW DATA TO THE DATABASE
  Future<void> addOfficer(BuildContext context) async {
    if (addOfficerFormKey.currentState!.validate()) {
      addOfficerFormKey.currentState!.save();

      try {
        Officer officer = Officer(
          ObjectId(),
          (_officersList.length) + 1,
          name,
          phone,
          email,
          genderValue.toString(),
          location,
          eduCertValue.toString(),
          dateOfEmployment,
          DateTime.now(),
        );

        DbHelper.insertOfficerData(officerData: officer);
        AppNotificationDesktop.success(
            context: context, message: '$name created successfully');
        _doneAndRefresh();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

//UPDATE DATA IN THE DATABASE
  Future<void> updateOfficerData() async {
    if (addOfficerFormKey.currentState!.validate()) {
      addOfficerFormKey.currentState!.save();

      try {
        Officer dataToEdit = _officersList.firstWhere(
          (data) => data.id.toString() == _officerDataToEdit.id.toString(),
        );
        Officer officer = Officer(
          dataToEdit.id,
          dataToEdit.officerId,
          name,
          phone,
          email,
          genderValue.toString(),
          location,
          eduCertValue.toString(),
          dateOfEmployment,
          dataToEdit.createdAt,
        );

        DbHelper.updateOfficerData(officerData: officer);
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
    emailController = TextEditingController();
    locationController = TextEditingController();
    dateOfEmploymentController = TextEditingController();

    getAllOfficerData();
  }

  @override
  void onReady() {
    isEditing(false);
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    locationController.dispose();
    dateOfEmploymentController.dispose();
  }
}
