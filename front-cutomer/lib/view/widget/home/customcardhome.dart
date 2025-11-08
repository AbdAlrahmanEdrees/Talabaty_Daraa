import 'package:tlabaty_app/controller/adv_controller.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<AdvControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          // الخلفية الرئيسية
          Container(
            alignment: Alignment.centerRight,
            constraints: const BoxConstraints(
              minHeight: 150, // ارتفاع افتراضي
            ),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 140, // مسافة حتى لا يدخل النص في الدائرة
                right: 20,
                top: 20,
                bottom: 20,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // أقصى عرض للنص = عرض الحاوية الحالية - مساحة الدائرة
                  double maxTextWidth = constraints.maxWidth;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxTextWidth),
                        child: Text(
                          title,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            height: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxTextWidth),
                        child: Text(
                          body,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          // الدائرة على أقصى اليسار دائمًا
          Positioned(
            top: -20,
            left: -20,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.secondColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
