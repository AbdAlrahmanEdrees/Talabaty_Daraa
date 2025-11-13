import 'package:get/get.dart';

class HomepageController extends GetxController {
  int pageIndex = 0;

  void changePage(int index) {
    pageIndex = index;
    update();
  }
}
