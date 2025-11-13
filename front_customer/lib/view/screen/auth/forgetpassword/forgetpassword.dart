import 'package:tlabaty_app/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
// import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/view/widget/auth/custombuttonauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtextbodyauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtextformauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'نسيت كلمة المرور؟'.tr,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextTitleAuth(text: "نسيت كلمة المرور؟"),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(
                    // please Enter Your Email Address To Recive A verification code
                    text:
                        "يرجى إدخال عنوان بريدك الإلكتروني لتلقي رمز التحقق".tr,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {},
                    mycontroller: controller.email,
                    hinttext: "يرجى إدخال بريدك الإلكتروني".tr,
                    iconData: Icons.email_outlined,
                    labeltext: "البريد الإلكتروني".tr,
                    // mycontroller: ,
                  ),
                  CustomButtomAuth(
                    text: "إرسال".tr,
                    onPressed: () {
                      controller.checkemail();
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
