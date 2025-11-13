import 'package:get/get.dart';
import 'package:talabat_daraa/app_core/services/orders_crud/read_service.dart';

enum OrderStatus { pending, ongoing, completed }

class OrdersPageController extends GetxController {
  final Rx<OrderStatus> selectedStatus = OrderStatus.pending.obs;

  final orders = <dynamic>[].obs;
  final isLoading = false.obs;
  final isMoreLoading = false.obs;
  final hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetcPendingOrders();
  }

  void changeTab(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        selectedStatus.value = OrderStatus.pending;
        fetcPendingOrders();
        break;
      case OrderStatus.completed:
        selectedStatus.value = OrderStatus.completed;
        fetcCompletedOrders();
        break;
      case OrderStatus.ongoing:
        selectedStatus.value = OrderStatus.ongoing;
        fetcOnGoingOrders();
        break;
    }
  }

  Future<void> fetcPendingOrders() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      orders.value = await OrdersReadService.fetchPendingOrders();
      print("==============================");
      print(orders[0].text);
      print("==============================");
      // orders.assignAll(orders);
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetcCompletedOrders() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      orders.value = await OrdersReadService.fetchCompletedOrders();
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetcOnGoingOrders() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      orders.value = await OrdersReadService.fetchOnGoingOrders();
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
