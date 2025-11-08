import 'package:tlabaty_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerRight, // المحاذاة لليمين
      child: Text(
        title,
        textAlign: TextAlign.right, // النص نفسه لليمين
        style: const TextStyle(
          fontSize: 40,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
