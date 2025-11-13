import 'package:tlabaty_app/core/class/statusrequest.dart';
import 'package:tlabaty_app/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AddAddresssginupcontroller extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  List<LatLng> markers = [];
  String? email;

  double? lat;
  double? long;

  LatLng? currentLocation;

  /// إضافة Marker على الخريطة
  void addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(latLng);
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  /// الانتقال لصفحة تفاصيل العنوان
  void goToPageAddDetailsAddress() {
    if (lat != null && long != null) {
      Get.toNamed(
        AppRoute.addressadddetails_sginup,
        arguments: {
          "lat": lat.toString(),
          "long": long.toString(),
          "email": email
        },
      );
    } else {
      Get.snackbar("تنبيه", "الرجاء اختيار الموقع على الخريطة");
    }
  }

  /// الحصول على الموقع الحالي مع التأكد من الأذونات
  Future<void> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error('GPS غير مفعل');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('تم رفض إذن الوصول للموقع');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
          'تم رفض الوصول للموقع بشكل دائم، يرجى تفعيل الأذونات من الإعدادات',
        );
      }

      // الحصول على الموقع الحالي
      Position position = await Geolocator.getCurrentPosition();
      currentLocation = LatLng(position.latitude, position.longitude);

      // إضافة Marker تلقائيًا عند الموقع الحالي
      addMarkers(currentLocation!);

      statusRequest = StatusRequest.none;
      update();
    } catch (e) {
      print("Error in getCurrentLocation: $e");
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    getCurrentLocation();
  }
}
