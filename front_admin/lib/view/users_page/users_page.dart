import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talabat_daraa/app_core/theme/colors.dart';
import 'package:talabat_daraa/app_core/theme/fonts.dart';
import 'package:talabat_daraa/control/users_page/users_page_controller.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UsersPageController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users', style: AppTextStyles.h12b),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black26,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
          // -------- Tabs ----------
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: UserType.values.map((status) {
                  final isSelected = controller.selectedUserType.value == status;
                  final label = _getStatusLabel(status).tr;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => controller.changeTab(status),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.red1.withOpacity(0.9)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            label,
                            style: AppTextStyles.p1.copyWith(
                              color: isSelected ? Colors.white : AppColors.black,
                              fontWeight:
                                  isSelected ? FontWeight.bold : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
          ),
            // 🔍 Search bar
            TextField(
              controller: controller.searchController,
              onChanged: controller.filterUsers,
              decoration: InputDecoration(
                hintText: 'search_hint'.tr,
                hintStyle: AppTextStyles.p2,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🧠 Reactive list of users
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.hasError.value) {
                  return Center(
                    child: Text('users_load_failed'.tr, style: AppTextStyles.p1),
                  );
                }

                if (controller.filteredUsers.isEmpty) {
                  return Center(
                    child: Text('no_users_found'.tr, style: AppTextStyles.p1),
                  );
                }

                return ListView.separated(
                  itemCount: controller.filteredUsers.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final user = controller.filteredUsers[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: user.approve!
                            ? AppColors.yellow1.withOpacity(0.1)
                            : AppColors.red3,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.red2, width: 0.8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.person, color: AppColors.red3, size: 28),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.name ?? 'no_name'.tr,
                                    style: AppTextStyles.h14b),
                                const SizedBox(height: 4),
                                Text(
                                  '${'id_label'.tr}: ${user.id ?? '-'} | ${'email_label'.tr}: ${user.email ?? 'N/A'}',
                                  style: AppTextStyles.p2,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.block),
                            onPressed: () =>
                                _showBanUserDialog(context, controller, user.id!),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),

      // ➕ Floating add button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.red1,
        icon: const Icon(Icons.add),
        label: Text('add_user'.tr),
        onPressed: () => _showAddUserDialog(context, controller),
      ),
    );
  }

  // 🪟 Form Dialog to Add User
  void _showAddUserDialog(BuildContext context, UsersPageController controller) {
    Get.dialog(
      AlertDialog(
        title: Text('add_new_user'.tr, style: AppTextStyles.h13b),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(controller.nameCtrl, 'name'.tr),
              _buildTextField(controller.emailCtrl, 'email'.tr),
              _buildTextField(controller.passwordCtrl, 'password'.tr, obscure: true),
              _buildTextField(controller.phoneCtrl, 'phone'.tr),
              const SizedBox(height: 12),

              // Role Dropdown
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.selectedRole.value,
                    items: [
                      DropdownMenuItem(value: 'admin', child: Text('admin'.tr)),
                      DropdownMenuItem(value: 'customer', child: Text('customer'.tr)),
                    ],
                    onChanged: (value) => controller.selectedRole.value = value!,
                    decoration: InputDecoration(
                      labelText: 'role'.tr,
                      border: const OutlineInputBorder(),
                    ),
                  )),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: Text('cancel'.tr),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.red2),
            onPressed: () async {
              await controller.addUser();
            },
            child: Text('add_user'.tr),
          ),
        ],
      ),
    );
  }

  // 🪟 Dialog to Ban User
  void _showBanUserDialog(
      BuildContext context, UsersPageController controller, int id) {
    Get.dialog(
      AlertDialog(
        title: Text('ban_user'.tr, style: AppTextStyles.h13b),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Text('ban_user_confirm'.tr, style: AppTextStyles.p1),
              const SizedBox(height: 12),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: Text('cancel'.tr),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.red2),
            onPressed: () async {
              await controller.banUser(id);
            },
            child: Text('confirm'.tr),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController ctrl, String label,
      {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: ctrl,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }


  
  
  String _getStatusLabel(UserType status) {
    switch (status) {
      case UserType.customer:
        return 'Customer';
      case UserType.driver:
        return 'Driver';
      case UserType.admin:
        return 'Admin';
    }
  }
}
