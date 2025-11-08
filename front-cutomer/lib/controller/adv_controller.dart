import 'package:get/get.dart';
import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/functions/handingdatacontroller.dart';
import 'package:tlabaty_app/core/services/services.dart';
import 'package:tlabaty_app/data/datasource/remote/adv_data.dart';

abstract class AdvController extends GetxController {
  getAdvertisements();
}

class AdvControllerImp extends AdvController {
  final AdvData advData = AdvData(Get.find());
  final MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  List<Map<String, dynamic>> advertisements = [];

  @override
  void onInit() {
    getAdvertisements();
    super.onInit();
  }

  @override
  getAdvertisements() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await advData.getData();
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success &&
          response['status'] == "success") {
        advertisements = List<Map<String, dynamic>>.from(response['data']);
      } else {
        advertisements.clear();
      }
    } catch (e) {
      statusRequest = StatusRequest.failure;
      advertisements.clear();
    }

    update();
  }
}
