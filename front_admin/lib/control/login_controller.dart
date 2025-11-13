import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talabat_daraa/app_core/services/auth/auth_service.dart';
import 'package:talabat_daraa/app_core/services/pref_service.dart';
import 'package:talabat_daraa/view/homepage.dart';

class LoginController extends GetxController {
  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final obscurePassword = true.obs;

  final prefs = AppPreferences();

  // Mock login function
  Future<void> login() async {
    final input = emailOrPhoneController.text.trim();
    final password = passwordController.text.trim();

    if (input.isEmpty || password.isEmpty) {
      Get.snackbar('error'.tr, 'empty_fields'.tr);
      return;
    }

    isLoading.value = true;

    final response=await AuthService.login(input, password);
    if (!response['success']) {
      isLoading.value = false;
      Get.snackbar('error'.tr, response['message'] ?? 'login_failed'.tr);
      return;
    }
    // Example logic: pretend all logins succeed
    await prefs.setLoggedIn(true);
    await prefs.setUserRole("admin");

    isLoading.value = false;

    Get.snackbar('success'.tr, 'login_success'.tr);
    // Navigate to dashboard
    Get.offAll(() => Homepage());
  }

  void resetPassword() {
    Get.snackbar('resitting_password'.tr, 'resitting_password_message'.tr);
  }

  @override
  void onClose() {
    emailOrPhoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
