import 'package:tlabaty_app/controller/auth/signup_controller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/core/functions/alertexitapp.dart';
import 'package:tlabaty_app/core/functions/validinput.dart';
import 'package:tlabaty_app/view/widget/auth/custombuttonauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtextbodyauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtextformauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtexttitleauth.dart';
import 'package:tlabaty_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'إنشاء حساب',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: PopScope(
        canPop: false, // يمنع الرجوع المباشر
        onPopInvoked: (didPop) async {
          if (didPop) return;
          await alertExitApp(); // عرض تنبيه الخروج
        },
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    CustomTextTitleAuth(text: "اهلا بك".tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(text: "إنشاء حساب".tr),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 20, "username");
                      },
                      mycontroller: controller.username,
                      hinttext: "ادخل اسم المستخدم".tr,
                      iconData: Icons.person_outline,
                      labeltext: "اسم المستخدم".tr,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 40, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "ادخل البريد الإلكتروني".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "البريد الإلكتروني".tr,
                    ),
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 7, 11, "phone");
                      },
                      mycontroller: controller.phone,
                      hinttext: "ادخل رقم الهاتف".tr,
                      iconData: Icons.phone_android_outlined,
                      labeltext: "رقم الهاتف".tr,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 30, "password");
                      },
                      mycontroller: controller.password,
                      hinttext: "ادخل كلمة المرور".tr,
                      iconData: Icons.lock_outline,
                      labeltext: "كلمة المرور".tr,
                    ),
                    CustomButtomAuth(
                      text: "إنشاء حساب".tr,
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    const SizedBox(height: 40),
                    CustomTextSignUpOrSignIn(
                      textone: " لديك حساب؟",
                      texttwo: "تسجيل الدخول  ",
                      onTap: () {
                        controller.goToSignIn();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
