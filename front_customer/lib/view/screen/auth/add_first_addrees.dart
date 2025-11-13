import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/controller/auth/add_addresssginupcontroller.dart';
import 'package:tlabaty_app/core/class/handlingdataview.dart';
import 'package:tlabaty_app/core/constant/color.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddFirstAddress extends StatelessWidget {
  const AddFirstAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddresssginupcontroller controller = Get.put(
      AddAddresssginupcontroller(),
    );

    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          'تحديد الموقع',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: GetBuilder<AddAddresssginupcontroller>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: [
              controller.currentLocation != null
                  ? FlutterMap(
                      options: MapOptions(
                        center: controller.currentLocation!,
                        zoom: 15,
                        interactiveFlags: InteractiveFlag.pinchZoom |
                            InteractiveFlag.drag |
                            InteractiveFlag.doubleTapZoom,
                        onTap: (tapPosition, point) {
                          // 👇 عند النقر على الخريطة يتم تحديث العلامة
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
                                (marker) => Marker(
                                  point: marker,
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

              // زر "إكمال"
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
                    "إكمال",
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
