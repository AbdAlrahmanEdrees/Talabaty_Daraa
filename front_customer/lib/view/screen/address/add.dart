import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/controller/address/add_controller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController controller = Get.put(AddAddressController());

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          'تحديد الموقع',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<AddAddressController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: [
              // الخريطة تغطي كل الشاشة تحت العنوان
              controller.currentLocation != null
                  ? FlutterMap(
                      options: MapOptions(
                        center: controller.currentLocation!,
                        zoom: 14,
                        onTap: (tapPosition, point) {
                          controller.addMarkers(point);
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: controller.markers
                              .map(
                                (e) => Marker(
                                  point: e,
                                  width: 50,
                                  height: 50,
                                  builder: (ctx) => const Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator()),

              // زر "اكمال" فوق الخريطة في أسفل الشاشة
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    controller.goToPageAddDetailsAddress();
                  },
                  child: const Text(
                    "اكمال",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
