import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat_daraa/app_core/services/pref_service.dart';
import 'package:talabat_daraa/app_core/localization/app_translations.dart';
import 'package:talabat_daraa/view/homepage.dart';
import 'package:talabat_daraa/view/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();

  final prefs = Get.put(AppPreferences());
  String langCode = prefs.getLanguage(); // e.g. 'ar' or 'en'

  runApp(MyApp(langCode: langCode));
}

class MyApp extends StatelessWidget {
  final String langCode;
  const MyApp({super.key, required this.langCode});

  @override
  Widget build(BuildContext context) {
  final bool isLoggedIn = Get.find<AppPreferences>().isLoggedIn();
    return ScreenUtilInit(
      // designSize: const Size(390, 844),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppTranslations(),
        locale: Locale(langCode),
        fallbackLocale: const Locale('en'),
        // home: isLoggedIn?Homepage():const LoginView(),
        home:Homepage(),
      ),
    );
  }
}
