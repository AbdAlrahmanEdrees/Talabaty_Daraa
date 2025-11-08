import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tlabaty_app/bindings/intialbindings.dart';
import 'package:tlabaty_app/core/functions/fcmconfig.dart';
import 'package:tlabaty_app/core/services/services.dart';
import 'package:tlabaty_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1️⃣ تهيئة الخدمات قبل تشغيل التطبيق
  await initialServices();
  requestPermissionNotification();
  fcmconfig();
  // 2️⃣ تشغيل التطبيق
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: routes,
      initialBinding: InitialBindings(),
    );
  }
}
