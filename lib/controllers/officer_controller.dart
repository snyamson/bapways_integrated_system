import 'dart:convert';

import 'package:bapways_integrated_system/constants/api_url.dart';
import 'package:bapways_integrated_system/models/officer.dart';
import 'package:bapways_integrated_system/services/api_service.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficerController extends GetxController with StateMixin<List> {
  final ApiService _apiService = ApiService();

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
  var officersList = <Officer>[].obs;

  // OFFICER TO EDIT
  late Officer officerToEdit;

  void assignOfficerToEdit(int id) {
    officerToEdit = officersList.firstWhere((officer) => officer.id == id);
  }

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

// OFFICERS API CODES

//FETCH ALL OFFICERS FROM THE DATABASE
  Future<void> getOfficersList() async {
    isLoading(true);
    Response response = await _apiService.getData(uri: ApiUrl.getOfficers);

    if (response.statusCode == 200) {
      officersList.value = [];
      var json = jsonDecode(response.bodyString!) as List;
      List<Officer> officers = json.map((o) => Officer.fromJson(o)).toList();
      officersList.addAll(officers);
      errorMap["isError"] = false;
      errorMap["errorMessage"] = '';
      isLoading(false);
    } else {
      errorMap["isError"] = true;
      errorMap["errorMessage"] = response.statusText;
      isLoading(false);
    }

    update();
  }

  // FORM SUBMISSION AND POSTING TO API
  void addOfficer() async {
    if (addOfficerFormKey.currentState!.validate()) {
      addOfficerFormKey.currentState!.save();

      final Officer officer = Officer(
          name: name,
          phone: phone,
          email: email,
          gender: genderValue.toString(),
          location: location,
          levelOfEduc: eduCertValue.toString(),
          dateOfEmployment: dateOfEmployment);

      var officerJson = officerToJson(officer);

      officersList.add(officer);

      try {
        final Response response = await _apiService.postData(
            uri: ApiUrl.postOfficer, body: officerJson);
        if (response.statusCode == 200) {
          //TODO: send a snackbar or toast to the user
          debugPrint('Successfully Posted to the Database');

          getOfficersList();

          addOfficerFormKey.currentState!.reset();
          genderValue.value = '';
          eduCertValue.value = '';
        }
      } catch (e) {
        //TODO: send a snackbar or toast to the user
        debugPrint(e.toString());
      }

      update();
    }
  }

  Future<void> updateOfficer(int id) async {
    if (addOfficerFormKey.currentState!.validate()) {
      addOfficerFormKey.currentState!.save();

      List<Officer> updatedItem =
          officersList.where((data) => data.id == id).toList();

      final Officer officer = Officer(
          name: name,
          phone: phone,
          email: email,
          gender: genderValue.toString(),
          location: location,
          levelOfEduc: eduCertValue.toString(),
          dateOfEmployment: dateOfEmployment);

      updatedItem[0] = officer;

      var officerJson = officerToJson(officer);

      try {
        final Response response = await _apiService.updateData(
            uri: '${ApiUrl.updateOfficer}/$id', body: officerJson);
        if (response.statusCode == 200) {
          //TODO: send a snackbar or toast to the user
          debugPrint('Successfully Updated the Entry');

          getOfficersList();

          addOfficerFormKey.currentState!.reset();
          genderValue.value = '';
          eduCertValue.value = '';
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
    emailController = TextEditingController();
    locationController = TextEditingController();
    dateOfEmploymentController = TextEditingController();

    getOfficersList();
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
