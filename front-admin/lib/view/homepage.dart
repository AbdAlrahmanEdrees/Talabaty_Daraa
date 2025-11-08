import 'package:flutter/material.dart';
import 'package:talabat_daraa/app_core/theme/colors.dart';
import 'package:get/get.dart';
import 'package:talabat_daraa/control/homepage_controller.dart';
import 'package:talabat_daraa/view/api_test.dart';
import 'package:talabat_daraa/view/orders_page/orders_page.dart';
import 'package:talabat_daraa/view/users_page/users_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  final List<Widget> pages = const [
    OrdersPage(),
    UsersPage(),
    ApiTest()
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomepageController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: AppColors.red2,
        //   title: Text('homepage_title'.tr),
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: PhysicalModel(
              elevation: 10,
              color: Colors.white,
              shadowColor: AppColors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
              child: Container(child: pages[controller.pageIndex]),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white.withAlpha(230),
          currentIndex: controller.pageIndex,
          onTap: controller.changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping),
              label: 'requests'.tr,
              backgroundColor: AppColors.orange1,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'users'.tr,
              backgroundColor: AppColors.orange1,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bug_report),
              label: 'api test'.tr,
              backgroundColor: AppColors.orange1,
            ),
          ],
        ),
      ),
    );
  }
}
