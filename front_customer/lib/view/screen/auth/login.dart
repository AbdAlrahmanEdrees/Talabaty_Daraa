import 'package:tlabaty_app/controller/auth/login_controller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
// import 'package:tlabaty_app/core/class/handlingdataview.dart';
// import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/core/functions/alertexitapp.dart';
import 'package:tlabaty_app/core/functions/validinput.dart';
import 'package:tlabaty_app/view/widget/auth/custombuttonauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtextbodyauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtextformauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtexttitleauth.dart';
import 'package:tlabaty_app/view/widget/auth/logoauth.dart';
import 'package:tlabaty_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'تسجيل الدخول',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: PopScope(
        canPop: false, // يمنع الرجوع الافتراضي
        onPopInvoked: (didPop) async {
          if (didPop) return; // إذا النظام سمح بالرجوع لا تعيد فتح الديالوج
          await alertExitApp(); // يعرض تنبيه الخروج
        },
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    const SizedBox(height: 20),
                    CustomTextTitleAuth(text: "اهلا بك".tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(text: "تسجيل الدخول".tr),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "ادخل الأيميل الخاص بك".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "البريد الإلكتروني".tr,
                    ),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustomTextFormAuth(
                        obscureText: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 30, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "ادخل كلمة المرور".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "كلمة المرور".tr,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        "نسيت كلمة المرور؟".tr,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    CustomButtomAuth(
                      text: "تسجيل الدخول".tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(height: 40),
                    CustomTextSignUpOrSignIn(
                      textone: "ليس لديك حساب؟",
                      texttwo: "إنشاء حساب  ",
                      onTap: () {
                        controller.goToSignUp();
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
