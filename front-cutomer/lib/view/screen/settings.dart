import 'package:tlabaty_app/controller/settings_controller.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/core/constant/imageasset.dart';
import 'package:tlabaty_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    // onTap: () {},
                    trailing: Switch(onChanged: (val) {}, value: true),
                    title: Text("تعطيل الإشعارات"),
                  ),
                  ListTile(
                    onTap: () {
                      // Get.toNamed(AppRoute.orderspending);
                    },
                    trailing: Icon(Icons.card_travel),
                    title: Text("الطلبات النشطة"),
                  ),
                  ListTile(
                    onTap: () {
                      // Get.toNamed(AppRoute.ordersarchive );
                    },
                    trailing: Icon(Icons.card_travel),
                    title: Text("الأرشيف"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.addressview);
                    },
                    trailing: Icon(Icons.location_on_outlined),
                    title: Text("العنوان"),
                  ),
                  ListTile(
                    onTap: () {},
                    trailing: Icon(Icons.help_outline_rounded),
                    title: Text("معلومات عنا"),
                  ),
                  ListTile(
                    onTap: () {},
                    trailing: Icon(Icons.phone_callback_outlined),
                    title: Text("تواصل معنا"),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text("تسجيل الخروج"),
                    trailing: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
