// import 'package:tlabaty_app/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:tlabaty_app/core/constant/color.dart';

requestPermissionNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
}

fcmconfig() async {
  print("hai =======================================================");

  FirebaseMessaging.onMessage.listen((message) async {
    print("================== Notification =================");
    print(message.notification?.title);
    print(message.notification?.body);

    final player = FlutterRingtonePlayer();

    // تشغيل صوت الإشعار
    await player.playNotification(volume: 1.0, looping: false, asAlarm: false);

    // عرض إشعار داخل التطبيق
    Get.snackbar(
      message.notification?.title ?? 'تنبيه جديد',
      message.notification?.body ?? '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.primaryColor,
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
    );

    // يمكنك إعادة تفعيل تحديث الصفحة هنا إن أردت:
    // refreshPageNotification(message.data);
  });
}


// refreshPageNotification(data) {
//   print("============================= page id ");
//   print(data['pageid']);
//   print("============================= page name ");
//   print(data['pagename']);
//   print("================== Current Route");
//   print(Get.currentRoute);

//   if (Get.currentRoute == "/orderspending" &&
//       data['pagename'] == "refreshorderpending") {
//     OrdersPendingController controller = Get.find();
//     controller.refrehOrder();
//   }
// }
//

// Firebase + stream 
// Socket io 
// Notification refresh 