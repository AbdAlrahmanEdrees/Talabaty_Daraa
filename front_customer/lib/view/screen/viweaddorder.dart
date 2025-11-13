import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/controller/viwe_add_ordercontroller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/data/model/addressmodel.dart';

class AddressViewOrder extends StatelessWidget {
  const AddressViewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewOrderController controller = Get.put(
      AddressViewOrderController(),
    );

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          'اختيار عنوان التوصيل',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
      ),
      body: GetBuilder<AddressViewOrderController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView.separated(
              itemCount: controller.data.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                return CardAddress(
                  addressModel: controller.data[i],
                  onTap: () {
                    // ✅ عرض نافذة تأكيد عند الضغط على العنوان
                    Get.defaultDialog(
                      title: "تأكيد الطلب",
                      middleText: "هل ترغب بإرسال الطلبية إلى هذا العنوان؟",
                      textCancel: "لا",
                      textConfirm: "نعم",
                      confirmTextColor: Colors.white,
                      buttonColor: AppColor.primaryColor,
                      onConfirm: () {
                        Get.back(); // إغلاق النافذة
                        controller.sendOrder(controller.data[i].addressId!);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onTap;

  const CardAddress({Key? key, required this.addressModel, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // 👈 الضغط على البطاقة لاختيار العنوان
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              addressModel.addressName ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              "${addressModel.addressCity ?? ''} - ${addressModel.addressStreet ?? ''}",
            ),
          ),
        ),
      ),
    );
  }
}
