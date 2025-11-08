import 'package:tlabaty_app/controller/homescreen_controller.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/core/constant/routes.dart';
import 'package:tlabaty_app/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        body: controller.listPage.elementAt(controller.currentpage),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoute.myorders);
              },
              child: const Icon(Icons.receipt_long, color: Colors.white),
            ),
            const SizedBox(height: 4),
            const Text(
              'طلبياتي',
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
