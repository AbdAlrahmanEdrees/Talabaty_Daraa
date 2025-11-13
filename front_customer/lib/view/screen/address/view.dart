import 'package:tlabaty_app/controller/address/view_controller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
import 'package:tlabaty_app/core/constant/routes.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:tlabaty_app/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewController controller = Get.put(AddressViewController());

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          'العناوين',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView.separated(
              itemCount: controller.data.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                return CardAddress(
                  index: i,
                  addressModel: controller.data[i],
                  onDelete: () {
                    controller.deleteAddress(controller.data[i].addressId!);
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
  final void Function()? onDelete;
  final int index;

  const CardAddress({
    Key? key,
    required this.addressModel,
    this.onDelete,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
          trailing: index == 0
              ? const Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ) // 🔒 العنوان الأول لا يمكن حذفه
              : IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    color: AppColor.primaryColor,
                  ),
                  onPressed: onDelete,
                ),
        ),
      ),
    );
  }
}
