import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talabat_daraa/app_core/services/users_crud/ban_user_service.dart';
import 'package:talabat_daraa/app_core/services/users_crud/create_user_service.dart';
import 'package:talabat_daraa/app_core/services/users_crud/read_service.dart';
import 'package:talabat_daraa/model/user.dart';

enum UserType { customer, driver, admin }


class UsersPageController extends GetxController {
  final Rx<UserType> selectedUserType = UserType.customer.obs;
  final isLoading = true.obs;
  final hasError = false.obs;

  final List<User> _users = [];
  final filteredUsers = <User>[].obs;

  // 🧍 Add user controllers
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final selectedRole = 'customer'.obs;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  
  void changeTab(UserType status) {
    if (selectedUserType.value != status) {
      selectedUserType.value = status;
      fetchUsers();
    }
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final users = await ReadService.getUsers();
      _users.assignAll(users);
      filteredUsers.assignAll(users);
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  void filterUsers(String query) {
    query = query.toLowerCase();
    if (query.isEmpty) {
      filteredUsers.assignAll(_users);
    } else {
      filteredUsers.assignAll(
        _users.where((u) {
          final nameMatch = u.name?.toLowerCase().contains(query) ?? false;
          if (nameMatch) return true;
          final idMatch = u.id?.toString().contains(query) ?? false;
          if (idMatch) return true;
          final emailMatch = u.email?.toLowerCase().contains(query) ?? false;
          if (emailMatch) return true;
          return false;
        }).toList(),
      );
    }
  }

  // 🆕 Add new user
  Future<void> addUser() async {
    if (nameCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty ||
        passwordCtrl.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Name, Email, and Password are required',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      // Get.back(); // Close dialog
      Get.snackbar(
        'Loading',
        'Adding user...',
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true,
      );

      final newUser = await CreateService.createUser(
        name: nameCtrl.text,
        email: emailCtrl.text,
        password: passwordCtrl.text,
        role: selectedRole.value,
        phone: phoneCtrl.text,
      );

      _users.add(newUser);
      filteredUsers.add(newUser);
      clearAddForm();

      Get.snackbar(
        'Success',
        'User added successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add user',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void clearAddForm() {
    nameCtrl.clear();
    emailCtrl.clear();
    passwordCtrl.clear();
    phoneCtrl.clear();
    selectedRole.value = 'customer';
  }

  @override
  void onClose() {
    searchController.dispose();
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    phoneCtrl.dispose();
    super.onClose();
  }

  // 🆕 Add new user
  Future<void> banUser(int id) async {
    try {
      // Get.back(); // Close dialog
      Get.snackbar(
        'Loading',
        'Banning user...',
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true,
      );
      final result = await UserBanService.banUser(id);
      if (result['success']) {
        // Update local user list or show success
      } else {
        // Show error
      }

      _users.map((user) {
        if (user.id == id) {
          user.approve = false;
        }
        return user;
      }).toList();

      Get.snackbar(
        'Success',
        'User got banned successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add user',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}
