import 'package:tlabaty_app/controller/forgetpassword/resetpassword_controller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
// import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/core/functions/validinput.dart';
import 'package:tlabaty_app/view/widget/auth/custombuttonauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtextbodyauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtextformauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'إعادة تعيين كلمة المرور',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextTitleAuth(text: "إعادة تعيين كلمة المرور".tr),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(text: "يرجى إدخال كلمة المرور الجديدة".tr),
                  const SizedBox(height: 15),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 40, "password");
                    },
                    mycontroller: controller.password,
                    hinttext: "يرجى إدخال كلمة المرور الجديدة".tr,
                    iconData: Icons.lock_outline,
                    labeltext: "كلمة المرور".tr,
                    // mycontroller: ,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,

                    valid: (val) {
                      return validInput(val!, 3, 40, "password");
                    },
                    mycontroller: controller.repassword,
                    hinttext: "يرجى إدخال تأكيد كلمة المرور الجديدة".tr,
                    iconData: Icons.lock_outline,
                    labeltext: "تأكيد كلمة المرور".tr,
                    // mycontroller: ,
                  ),
                  CustomButtomAuth(
                    text: "إعادة تعيين كلمة المرور".tr,
                    onPressed: () {
                      controller.goToSuccessResetPassword();
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
