// import 'package:tlabaty_app/controller/home_controller.dart';
// import 'package:tlabaty_app/core/constant/color.dart';
// import 'package:tlabaty_app/data/model/itemsmodel.dart';
// // import 'package:tlabaty_app/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ListItemsHome extends GetView<HomeControllerImp> {
//   const ListItemsHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 140,
//       child: ListView.builder(
//           itemCount: controller.items.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, i) {
//             return ItemsHome(
//                 itemsModel: ItemsModel.fromJson(controller.items[i]));
//           }),
//     );
//   }
// }

// class ItemsHome extends StatelessWidget {
//   final ItemsModel itemsModel;
//   const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [

//         Container(
//           decoration: BoxDecoration(
//               // ignore: deprecated_member_use
//               color: AppColor.black.withOpacity(0.3),
//               borderRadius: BorderRadius.circular(20)),
//           height: 120,
//           width: 200,
//         ),
//         Positioned(
//             left: 10,
//             child: Text(
//               "${itemsModel.itemsName}",
//               style: const TextStyle(
//                   color: Colors.white,
//                   // fontWeight: FontWeight.bold,
//                   fontSize: 14),
//             ))
//       ],
//     );
//   }
// }
