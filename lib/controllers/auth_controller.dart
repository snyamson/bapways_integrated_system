import 'package:bapways_integrated_system/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm/realm.dart';
import 'package:bapways_integrated_system/models/user.dart' as app_user;

class AuthController extends GetxController {
  final authFormKey = GlobalKey<FormState>();
  final authScreenFormKey = GlobalKey<FormState>();

  late TextEditingController authUsernameController;
  late TextEditingController authPasswordController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController positionController;
  late TextEditingController roleController;

  // OBSERVABLES
  final RxBool _isUserFound = false.obs;
  final RxBool _isAuthSubmitted = false.obs;

  RxBool get isUserFound => _isUserFound;
  RxBool get isAuthSubmitted => _isAuthSubmitted;

// CURRENT USER
  late app_user.User _currentUser;

  app_user.User get currentUser => _currentUser;

  // FORM DATA
  String authUsername = '';
  String authPassword = '';
  String username = '';
  String password = '';
  String fullName = '';
  String email = '';
  String position = '';
  String role = '';

  // FORM VALIDATION
  String? validate(String value, String header) {
    if (value.trim().isEmpty) {
      return '$header is required';
    }
    return null;
  }

  // GENERATE ACCESS
  Future<void> generateAccess() async {
    if (authFormKey.currentState!.validate()) {
      authFormKey.currentState!.save();

      try {
        app_user.User user = app_user.User(
          ObjectId(),
          username,
          password,
          fullName,
          email,
          position,
          role,
          DateTime.now(),
        );

        await DbHelper.insertUserData(userData: user);
        authFormKey.currentState!.reset();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> getCurrentUser() async {
    if (authScreenFormKey.currentState!.validate()) {
      authScreenFormKey.currentState!.save();

      try {
        isAuthSubmitted.value = true;
        final query = DbHelper.getUserData(
          username: authUsername,
          password: authPassword,
        );
        if (query != null) {
          if (query.isEmpty) {
            _isUserFound.value = false;
          } else {
            _currentUser = query.toList()[0];
            _isUserFound.value = true;
          }
        }
        authScreenFormKey.currentState!.reset();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    authUsernameController = TextEditingController();
    authPasswordController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    positionController = TextEditingController();
    roleController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    authUsernameController.dispose();
    authPasswordController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    positionController.dispose();
    roleController.dispose();
  }
}
