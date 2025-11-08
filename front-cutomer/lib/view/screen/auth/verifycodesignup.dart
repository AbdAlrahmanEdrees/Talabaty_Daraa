import 'package:tlabaty_app/controller/auth/verfiycodesignup_controller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
// import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/view/widget/auth/customtextbodyauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'التحقق من الرمز',
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                const CustomTextTitleAuth(text: "رمز التحقق"),
                const SizedBox(height: 10),
                CustomTextBodyAuth(
                  text: "يرجى إدخال الرمز المرسل إلى ${controller.email}",
                ),
                const SizedBox(height: 15),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    controller.goToSuccessSignUp(verificationCode);
                  },
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    controller.reSend();
                  },
                  child: Center(
                    child: Text(
                      "إعادة إرسال رمز التحقق",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
