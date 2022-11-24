import 'package:bapways_integrated_system/components/common/app_notification_desktop.dart';
import 'package:bapways_integrated_system/db/db_helper.dart';
import 'package:bapways_integrated_system/screens/auth/auth_screen_desktop.dart';
import 'package:bapways_integrated_system/screens/home/home_screen_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
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
  final _currentUser = <app_user.User>[];

  RxBool get isUserFound => _isUserFound;
  RxBool get isAuthSubmitted => _isAuthSubmitted;

// CURRENT USER
  // late app_user.User _currentUser;

  app_user.User get currentUser => _currentUser.first;

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

  String? validateEmail(String value, String header) {
    if (value.trim().isEmpty) {
      return '$header is required';
    } else if (!GetUtils.isEmail(value)) {
      return '$header is not valid';
    }
    return null;
  }

  // GENERATE ACCESS
  Future<void> generateAccess(BuildContext context) async {
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
        AppNotificationDesktop.success(
          context: context,
          message: '$username granted access successfully',
        );
        authFormKey.currentState!.reset();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> getCurrentUser(BuildContext context) async {
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
            AppNotificationDesktop.error(
              context: context,
              message: 'Username or Password Incorrect',
            );
          } else {
            _currentUser.assignAll(query);
            _isUserFound.value = true;
            navigate(context);
          }
        }
        authScreenFormKey.currentState!.reset();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    Navigator.pushAndRemoveUntil(
      context,
      FluentPageRoute(
        builder: (context) => const AuthScreenDesktop(),
      ),
      (route) => false,
    );
    _isAuthSubmitted.value = false;
    _isUserFound.value = false;
    _currentUser.clear();
  }

  void navigate(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      FluentPageRoute(
        builder: (context) => HomeScreenDesktop(),
      ),
      (route) => false,
    );
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
