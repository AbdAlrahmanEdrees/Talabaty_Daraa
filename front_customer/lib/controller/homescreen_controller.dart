import 'package:tlabaty_app/core/constant/routes.dart';
import 'package:tlabaty_app/view/screen/adv.dart';
// import 'package:tlabaty_app/view/screen/notification.dart';
// import 'package:tlabaty_app/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/view/screen/orders.dart';
import 'package:tlabaty_app/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    // NotificationView() ,
    OrderPage(),
    const Center(child: Text("Notification")),

    Settings(),
  ];

  List bottomappbar = [
    {"title": "العروض", "icon": Icons.campaign},
    {"title": "طلب", "icon": Icons.shopping_cart_checkout},
    {"title": "الأشعارات", "icon": Icons.notifications_active_outlined},
    {"title": "الإعدادات", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
