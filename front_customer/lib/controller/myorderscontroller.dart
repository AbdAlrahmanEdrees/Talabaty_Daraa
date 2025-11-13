import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/functions/handingdatacontroller.dart';
import 'package:tlabaty_app/core/services/services.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/data/datasource/remote/get_orders_data.dart';

abstract class Myorderscontroller extends GetxController {
  getOrders();
  String orderStateText(int state);

  deleteOrder(String orderId);
  editOrder(String orderId, String newText);
}

class MyorderscontrollerImp extends Myorderscontroller {
  final GetOrdersData getOrdersData = GetOrdersData(Get.find());
  final MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  late String email;

  List<Map<String, dynamic>> newOrdersList = [];
  List<Map<String, dynamic>> processingOrdersList = [];
  List<Map<String, dynamic>> deliveredOrdersList = [];

  @override
  void onInit() {
    super.onInit();
    email = myServices.sharedPreferences.getString("email") ?? "";
    getOrders();
  }

  @override
  getOrders() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await getOrdersData.postdata(email);
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success &&
          response['status'] == "success") {
        List<Map<String, dynamic>> allOrders = List<Map<String, dynamic>>.from(
          response['data'],
        );

        newOrdersList = allOrders.where((e) => e['orders_state'] == 0).toList();
        processingOrdersList = allOrders
            .where((e) => e['orders_state'] == 1)
            .toList();
        deliveredOrdersList = allOrders
            .where((e) => e['orders_state'] == 2)
            .toList();
      } else {
        newOrdersList.clear();
        processingOrdersList.clear();
        deliveredOrdersList.clear();
      }
    } catch (e) {
      statusRequest = StatusRequest.failure;
      newOrdersList.clear();
      processingOrdersList.clear();
      deliveredOrdersList.clear();
    }

    update();
  }

  @override
  String orderStateText(int state) {
    switch (state) {
      case 0:
        return "جديد";
      case 1:
        return "قيد المعالجة";
      case 2:
        return "تم التسليم";
      default:
        return "غير معروف";
    }
  }

  // دالة حذف الطلبية مع تأكيد داخلي باستخدام GetX وتصميم AppColor
  @override
  deleteOrder(String orderId) async {
    bool confirmed =
        await Get.defaultDialog<bool>(
          title: "تأكيد الحذف",
          middleText: "هل أنت متأكد من حذف الطلبية؟",
          textCancel: "لا",
          textConfirm: "نعم",
          buttonColor: AppColor.primaryColor,
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back(result: true);
          },
          onCancel: () {
            Get.back(result: false);
          },
          barrierDismissible: false,
        ) ??
        false;

    if (!confirmed) return;

    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await getOrdersData.deletedata(orderId, email);
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success &&
          response['status'] == "success") {
        Get.snackbar(
          "نجاح",
          "تم حذف الطلبية بنجاح",
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
        );
        getOrders();
      } else {
        Get.snackbar(
          "خطأ",
          response['message'] ?? "حدث خطأ أثناء الحذف",
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      statusRequest = StatusRequest.failure;
      Get.snackbar(
        "خطأ",
        "حدث خطأ أثناء الحذف",
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white,
      );
    }

    update();
  }

  // دالة تعديل الطلبية مع تصميم AppColor
  @override
  editOrder(String orderId, String newText) async {
    if (newText.trim().isEmpty) {
      Get.snackbar(
        "خطأ",
        "يجب إدخال محتوى الطلبية الجديد",
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white,
      );
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await getOrdersData.editorder(orderId, email, newText);
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success &&
          response['status'] == "success") {
        Get.snackbar(
          "نجاح",
          "تم تعديل الطلبية بنجاح",
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
        );
        getOrders();
      } else {
        Get.snackbar(
          "خطأ",
          response['message'] ?? "حدث خطأ أثناء التعديل",
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      statusRequest = StatusRequest.failure;
      Get.snackbar(
        "خطأ",
        "حدث خطأ أثناء التعديل",
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white,
      );
    }

    update();
  }
}
