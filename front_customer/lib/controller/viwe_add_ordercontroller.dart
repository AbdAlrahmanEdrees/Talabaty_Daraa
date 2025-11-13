import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/core/functions/handingdatacontroller.dart';
import 'package:tlabaty_app/core/services/services.dart';
import 'package:tlabaty_app/data/datasource/remote/address_data.dart';
import 'package:tlabaty_app/data/datasource/remote/order_insert_data.dart';
import 'package:tlabaty_app/data/model/addressmodel.dart';

class AddressViewOrderController extends GetxController {
  OrderInsertData orderInsertData = OrderInsertData(Get.find());
  AddressData addressData = AddressData(Get.find());

  String? ordertext;
  List<AddressModel> data = [];
  late String email;

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  /// 🧾 جلب العناوين من السيرفر
  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.clear();
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  /// 🚚 إرسال الطلب إلى السيرفر بناءً على العنوان المحدد
  Future<void> sendOrder(String addressid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await orderInsertData.postdata(email, ordertext!, addressid);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.snackbar(
          "نجاح",
          "تم إرسال الطلبية بنجاح ✅",
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "فشل",
          response['message'] ?? "حدث خطأ أثناء تنفيذ الطلب",
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        "خطأ",
        "فشل الاتصال بالخادم",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    update();
  }

  @override
  void onInit() {
    var arg = Get.arguments['order'];

    if (arg is TextEditingController) {
      ordertext = arg.text;
    } else if (arg is String) {
      ordertext = arg;
    } else {
      ordertext = "";
    }

    email = myServices.sharedPreferences.getString("email") ?? "";

    /// ✅ استدعاء العناوين عند تحميل الصفحة
    getData();

    super.onInit();
  }
}
