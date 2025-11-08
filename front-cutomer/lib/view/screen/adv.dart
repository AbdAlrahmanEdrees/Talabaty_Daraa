import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/controller/adv_controller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/view/widget/home/customcardhome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // إنشاء الكنترولر لجلب الإعلانات
    final AdvControllerImp controller = Get.put(AdvControllerImp());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "الرئيسية",
            style: TextStyle(
              color: AppColor.grey,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GetBuilder<AdvControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.advertisements.isEmpty
                  ? const Center(
                      child: Text(
                        "لا توجد إعلانات حاليا",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.advertisements.length,
                      itemBuilder: (context, index) {
                        final adv = controller.advertisements[index];
                        return CustomCardHome(
                          title: adv['advertisements_title'] ?? "",
                          body: adv['advertisements_body'] ?? "",
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
