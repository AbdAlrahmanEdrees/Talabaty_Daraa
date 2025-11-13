import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talabat_daraa/app_core/theme/colors.dart';
import 'package:talabat_daraa/app_core/theme/fonts.dart';
import 'package:talabat_daraa/control/orders_page/orders_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat_daraa/model/order.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrdersPageController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('orders'.tr, style: AppTextStyles.h12b),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black26,
      ),
      body: Column(
        children: [
          // -------- Tabs ----------
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: OrderStatus.values.map((status) {
                  final isSelected = controller.selectedStatus.value == status;
                  final label = _getStatusLabel(status).tr;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => controller.changeTab(status),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.red1.withOpacity(0.9)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            label,
                            style: AppTextStyles.p1.copyWith(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
          ),

          // -------- List ----------
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.orders.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

                    print("xxx  ${controller.orders.length} yyy");
              return RefreshIndicator(
                onRefresh: () async => {
                  controller.changeTab(controller.selectedStatus.value),
                },
                color: AppColors.red1,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    final order = controller.orders[index];
                    return _buildOrderCard(context,order);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context,var order) {
    return InkWell(
      onTap: ()=>_showOrderTextDialog(context,order),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          title: Text('Order #${order.id}', style: AppTextStyles.h14b),
          subtitle: Text(
            '${'customer'.tr}: ${order.customer}',
            style: AppTextStyles.p2.copyWith(color: Colors.black54),
          ),
          // trailing: Text(
          //   '\$${order['total']}',
          //   style: AppTextStyles.p1b.copyWith(color: AppColors.red2),
          // ),
        ),
      ),
    );
  }

  String _getStatusLabel(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'pending';
      case OrderStatus.ongoing:
        return 'ongoing';
      case OrderStatus.completed:
        return 'completed';
    }
  }


  
  void _showOrderTextDialog(
      BuildContext context, var order) {
    Get.dialog(
      AlertDialog(
        title: Text('text'.tr, style: AppTextStyles.h13b),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Text(order.text, style: AppTextStyles.p1),
              const SizedBox(height: 12),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: Text('cancel'.tr),
          ),
        ],
      ),
    );
  }
}
