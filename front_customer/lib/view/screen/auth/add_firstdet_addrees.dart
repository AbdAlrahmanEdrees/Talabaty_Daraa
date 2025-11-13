import 'package:tlabaty_app/controller/address/adddetails_controller.dart';
import 'package:tlabaty_app/controller/auth/add_addresss_detginupcontroller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/view/widget/auth/custombuttonauth.dart';
import 'package:tlabaty_app/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFirstdetAddrees extends StatelessWidget {
  const AddFirstdetAddrees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddresssDetginupcontroller controller = Get.put(
      AddAddresssDetginupcontroller(),
    );

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: const Text('إضافة تفاصيل العنوان'),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<AddAddresssDetginupcontroller>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: ListView(
              children: [
                CustomTextFormAuth(
                  hinttext: "المدينة",
                  labeltext: "المدينة",
                  iconData: Icons.location_city,
                  mycontroller: controller.city,
                  valid: (val) {},
                  isNumber: false,
                ),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  hinttext: "الشارع",
                  labeltext: "الشارع",
                  iconData: Icons.streetview,
                  mycontroller: controller.street,
                  valid: (val) {},
                  isNumber: false,
                ),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  hinttext: "الاسم",
                  labeltext: "الاسم",
                  iconData: Icons.near_me,
                  mycontroller: controller.name,
                  valid: (val) {},
                  isNumber: false,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      controller.addAddress();
                    },
                    child: const Text(
                      "إضافة",
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
