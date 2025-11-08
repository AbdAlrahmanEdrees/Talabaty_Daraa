import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talabat_daraa/control/login_controller.dart';
import 'package:talabat_daraa/app_core/theme/colors.dart';
import 'package:talabat_daraa/app_core/theme/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Directionality(
      textDirection: TextDirection.rtl, // auto handled, but good for Arabic default
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Talabat',style:AppTextStyles.h11b.copyWith(color:AppColors.red2,fontFamily: 'Sans_Serif_Poppins',
                fontWeight: FontWeight.w500,fontSize: 80)),
                SizedBox(height: 40.h),
                Text(
                  'login_title'.tr, // 🔥 localized text
                  style: AppTextStyles.h21.copyWith(color: AppColors.red2),
                ),
                SizedBox(height: 50.h),

                // Email / phone input
                TextField(
                  controller: controller.emailOrPhoneController,
                  decoration: InputDecoration(
                    labelText: 'email_phone'.tr,
                    labelStyle:
                        AppTextStyles.p1.copyWith(color: AppColors.black),
                    prefixIcon: Icon(Icons.person, color: AppColors.red3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: AppColors.red3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: AppColors.red1, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Password input
                Obx(() => TextField(
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword.value,
                      decoration: InputDecoration(
                        labelText: 'password'.tr,
                        labelStyle:
                            AppTextStyles.p1.copyWith(color: AppColors.black),
                        prefixIcon: Icon(Icons.lock, color: AppColors.red3),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.red3,
                          ),
                          onPressed: () => controller.obscurePassword.toggle(),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: AppColors.red3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide:
                              BorderSide(color: AppColors.red1, width: 2),
                        ),
                      ),
                    )),
                SizedBox(height: 10.h),

                // Forgot password
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: controller.resetPassword,
                    child: Text(
                      'forgot_password'.tr,
                      style: AppTextStyles.p2.copyWith(
                        color: AppColors.orange2,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Login button
                Obx(() => ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () => controller.login(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red2,
                        minimumSize: Size(double.infinity, 55.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'login_button'.tr,
                              style: AppTextStyles.h13b
                                  .copyWith(color: Colors.white),
                            ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
