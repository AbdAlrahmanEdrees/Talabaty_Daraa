import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/controller/myorderscontroller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
import 'package:tlabaty_app/core/constant/color.dart';

class OrdersMessagesPage extends StatelessWidget {
  OrdersMessagesPage({super.key});

  final MyorderscontrollerImp controller = Get.put(MyorderscontrollerImp());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text(
            "عرض الطلبات",
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
          ),
          bottom: TabBar(
            indicatorColor: AppColor.primaryColor,
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "جديد"),
              Tab(text: "قيد المعالجة"),
              Tab(text: "تم التسليم"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: GetBuilder<MyorderscontrollerImp>(
            builder: (_) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: TabBarView(
                  children: [
                    _buildOrdersList(controller.newOrdersList),
                    _buildOrdersList(controller.processingOrdersList),
                    _buildOrdersList(controller.deliveredOrdersList),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildOrdersList(List<Map<String, dynamic>> orders) {
    if (orders.isEmpty) {
      return const Center(
        child: Text(
          "لا توجد طلبات",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final bool canEdit = order['orders_state'] == 0;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الحالة: ${controller.orderStateText(order['orders_state'])}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  order['orders_text'] ?? "",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Text(
                  "تاريخ الإنشاء: ${order['orders_createdate'] ?? ""}",
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 12),
                if (canEdit)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: AppColor.primaryColor,
                        ),
                        onPressed: () {
                          // فتح نافذة حوارية لتعديل الطلبية
                          _showEditDialog(
                            order['orders_id'].toString(),
                            order['orders_text'] ?? "",
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: AppColor.primaryColor,
                        ),
                        onPressed: () {
                          controller.deleteOrder(order['orders_id'].toString());
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEditDialog(String orderId, String currentText) {
    final TextEditingController editController = TextEditingController(
      text: currentText,
    );

    Get.defaultDialog(
      title: "تعديل الطلبية",
      content: Column(
        children: [
          TextField(
            controller: editController,
            maxLines: null,
            minLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
              ),
            ),
          ),
        ],
      ),
      textCancel: "إلغاء",
      textConfirm: "حفظ",
      buttonColor: AppColor.primaryColor,
      confirmTextColor: Colors.white,
      onConfirm: () {
        if (editController.text.trim().isEmpty) {
          Get.snackbar(
            "خطأ",
            "يجب إدخال محتوى الطلبية الجديد",
            backgroundColor: AppColor.primaryColor,
            colorText: Colors.white,
          );
        } else {
          controller.editOrder(orderId, editController.text.trim());
          Get.back();
        }
      },
      onCancel: () {
        Get.back();
      },
      barrierDismissible: false,
    );
  }
}
