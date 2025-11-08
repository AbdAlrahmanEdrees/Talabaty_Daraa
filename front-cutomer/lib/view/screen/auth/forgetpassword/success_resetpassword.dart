import 'package:tlabaty_app/controller/auth/successresetpassword_controller.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(
      SuccessResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'تمت العملية بنجاح',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "تمت إعادة تعيين كلمة المرور بنجاح",
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 30),
            ),
            SizedBox(height: 20),
            Text("يرجى تسجيل الدخول باستخدام كلمة المرور الجديدة".tr),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "تسجيل الدخول".tr,
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
