import 'dart:convert';
import 'dart:io';

import 'package:bapways_integrated_system/components/common/app_notification_desktop.dart';
import 'package:bapways_integrated_system/models/cocoa_distribution.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/api_url.dart';
import '../services/api_service.dart';

class CocoaController extends GetxController {
  final ApiService _apiService = ApiService();

  final addCocoaDistributionFormKey = GlobalKey<FormState>();

  late TextEditingController farmerIdController;
  late TextEditingController clientNameController;
  late TextEditingController kgToCompanyController;
  late TextEditingController kgToClientController;
  late TextEditingController totalBagsController;
  late TextEditingController dateOfSaleController;

  // OBSERVABLES
  var index = 0.obs;
  var isLoading = false.obs;
  var isEditing = false.obs;
  var errorMap = <String, dynamic>{"isError": false, "errorMessage": ''}.obs;
  var cocoaDistributionList = <CocoaDistribution>[].obs;

  // OFFICER TO EDIT
  late CocoaDistribution cocoaDistributionToEdit;

  void assignCocoaDistributionToEdit(int id) {
    cocoaDistributionToEdit =
        cocoaDistributionList.firstWhere((data) => data.id == id);
  }

  // FORM DATA
  String farmerId = '';
  String clientName = '';
  String kgToCompany = '';
  String kgToClient = '';
  String bags = '';
  String dateOfSale = '';

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

  // COCOA DISTRIBUTION API CODES

//FETCH ALL DATA FROM THE DATABASE
  Future<void> getCocoaDistributionList() async {
    isLoading(true);
    Response response =
        await _apiService.getData(uri: ApiUrl.getCocoaDistribution);
    if (response.statusCode == 200) {
      cocoaDistributionList.value = [];
      var json = jsonDecode(response.bodyString!) as List;
      List<CocoaDistribution> cocoaDistributionData =
          json.map((o) => CocoaDistribution.fromMap(o)).toList();
      cocoaDistributionList.addAll(cocoaDistributionData);
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

  // ADD COCOA DISTRIBUTION TO THE DATABASE
  Future<void> addCocoaDistributionData(BuildContext context) async {
    if (addCocoaDistributionFormKey.currentState!.validate()) {
      addCocoaDistributionFormKey.currentState!.save();

      final CocoaDistribution cocoaDistribution = CocoaDistribution(
          clientId: farmerId,
          clientName: clientName,
          kgToCompany: kgToCompany,
          kgToClient: kgToClient,
          totalKg: bags,
          bags: bags,
          dateOfSale: dateOfSale);

      var cocoaDistributionJson = cocoaDistributionToJson(cocoaDistribution);

      cocoaDistributionList.add(cocoaDistribution);

      try {
        final Response response = await _apiService.postData(
            uri: ApiUrl.postCocoaDistribution, body: cocoaDistributionJson);

        switch (response.statusCode) {
          case 200:
            getCocoaDistributionList();
            addCocoaDistributionFormKey.currentState!.reset();
            AppNotificationDesktop.success(
                context: context,
                message: 'Entry was added to the database successfully');

            break;
          default:
            AppNotificationDesktop.error(
                context: context, message: 'Error occurred when adding entry');
        }
      } on SocketException {
        AppNotificationDesktop.error(
            context: context, message: 'Error occurred when adding entry');
      }

      update();
    }
  }

  // UPDATE A CLIENT
  Future<void> updateCocoaDistributionEntry(
      int id, BuildContext context) async {
    if (addCocoaDistributionFormKey.currentState!.validate()) {
      addCocoaDistributionFormKey.currentState!.save();

      List<CocoaDistribution> updatedItem =
          cocoaDistributionList.where((data) => data.id == id).toList();

      final CocoaDistribution cocoaDistribution = CocoaDistribution(
          clientId: farmerId,
          clientName: clientName,
          kgToCompany: kgToCompany,
          kgToClient: kgToClient,
          totalKg: bags,
          bags: bags,
          dateOfSale: dateOfSale);

      updatedItem[0] = cocoaDistribution;

      var cocoaDistributionJson = cocoaDistributionToJson(cocoaDistribution);

      try {
        final Response response = await _apiService.updateData(
            uri: '${ApiUrl.updateCocoaDistribution}/$id',
            body: cocoaDistributionJson);
        switch (response.statusCode) {
          case 200:
            getCocoaDistributionList();
            addCocoaDistributionFormKey.currentState!.reset();
            AppNotificationDesktop.success(
                context: context, message: 'Entry was updated successfully');
            break;
          default:
            AppNotificationDesktop.error(
                context: context,
                message: 'Error occurred when updating entry');
        }
      } on SocketException catch (e) {
        debugPrint(e.toString());
        AppNotificationDesktop.error(
            context: context, message: 'Error occurred when updating entry');
      }

      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    farmerIdController = TextEditingController();
    clientNameController = TextEditingController();
    kgToCompanyController = TextEditingController();
    kgToClientController = TextEditingController();
    totalBagsController = TextEditingController();
    dateOfSaleController = TextEditingController();

    getCocoaDistributionList();
  }

  @override
  void onReady() {
    isEditing(false);
  }
}
