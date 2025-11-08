import 'package:flutter/material.dart';
import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/core/constant/routes.dart';
import 'package:tlabaty_app/core/functions/handingdatacontroller.dart';
import 'package:tlabaty_app/core/services/services.dart';
import 'package:tlabaty_app/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/data/datasource/remote/order_insert_data.dart';

abstract class OrderController extends GetxController {
  insert_order();
}

class OrderControllerImp extends OrderController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController ordertext;

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  late String email; // هنا نخزن البريد الإلكتروني

  @override
  void onInit() {
    super.onInit();
    ordertext = TextEditingController();

    // جلب البريد الإلكتروني من SharedPreferences
    email = myServices.sharedPreferences.getString("email") ?? "";
    print("User Email: $email");
  }

  @override
  insert_order() async {
    if (ordertext.text.trim().isEmpty) {
      Get.snackbar(
        "خطأ",
        "من فضلك اكتب محتوى الطلبية",
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white,
      );
      return;
    }

    // عرض رسالة تأكيد قبل الإرسال
    Get.defaultDialog(
      title: "تأكيد الطلبية",
      middleText: "هل تود تأكيد الطلبية؟",
      textConfirm: "نعم",
      textCancel: "لا",
      buttonColor: AppColor.primaryColor,
      confirmTextColor: Colors.white,
      onConfirm: () async {
        Get.back(); // إغلاق الـ Dialog قبل الإرسال
              Get.toNamed(
        AppRoute.viweaddorder,
        arguments: {"order": ordertext},
      );

      },
      onCancel: () {
        Get.back(); // إغلاق الـ Dialog عند الضغط على لا
      },
    );
  }
}
