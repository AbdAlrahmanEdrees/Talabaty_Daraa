import 'package:tlabaty_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  useMaterial3: true, // ✅ يضمن استخدام النظام الجديد
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.primaryColor),
    titleTextStyle: const TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: "PlayfairDisplay",
      fontSize: 25,
    ),
    backgroundColor: Colors.grey[50],
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      // بدل headline1
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.black,
    ),
    displayMedium: TextStyle(
      // بدل headline2
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      // بدل bodyText1
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      // بدل bodyText2
      height: 2,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  useMaterial3: true, // ✅ نفس الشي هنا
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      // بدل headline1
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.black,
    ),
    displayMedium: TextStyle(
      // بدل headline2
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      // بدل bodyText1
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      // بدل bodyText2
      height: 2,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
  primarySwatch: Colors.blue,
);
