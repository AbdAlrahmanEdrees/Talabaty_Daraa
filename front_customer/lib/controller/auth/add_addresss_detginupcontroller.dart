import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/constant/routes.dart';
import 'package:tlabaty_app/core/functions/handingdatacontroller.dart';
import 'package:tlabaty_app/core/services/services.dart';
import 'package:tlabaty_app/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAddresssDetginupcontroller extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;
  String? email;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    email = Get.arguments['email'];

    print(lat);
    print(long);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressData.addData_signup(
      email!,
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
    );

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.successSignUp);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
