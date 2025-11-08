import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/controller/order_controller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/view/widget/auth/custombuttonauth.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  final OrderControllerImp controller = Get.put(OrderControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'طلبية جديدة',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: controller.ordertext,
                  maxLines: null,
                  minLines: 8,
                  maxLength: 10000,
                  decoration: InputDecoration(
                    labelText: 'اكتب محتوى الطلبية هنا',
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    floatingLabelStyle: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColor.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        child: CustomButtomAuth(
          text: 'إرسال الطلبية',
          onPressed: () {
            if (controller.ordertext.text.trim().isEmpty) {
              Get.snackbar(
                "خطأ",
                "من فضلك اكتب محتوى الطلبية",
                backgroundColor: AppColor.primaryColor,
                colorText: Colors.white,
              );
              return;
            }
            controller.insert_order();
          },
        ),
      ),
    );
  }
}
