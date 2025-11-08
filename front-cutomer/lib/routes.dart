import 'package:tlabaty_app/core/constant/routes.dart';
import 'package:tlabaty_app/view/screen/address/add.dart';
import 'package:tlabaty_app/view/screen/address/adddetails.dart';
import 'package:tlabaty_app/view/screen/address/view.dart';
import 'package:tlabaty_app/view/screen/auth/add_first_addrees.dart';
import 'package:tlabaty_app/view/screen/auth/add_firstdet_addrees.dart';
import 'package:tlabaty_app/view/screen/auth/login.dart';
import 'package:tlabaty_app/core/middleware/mymiddleware.dart';
// import 'package:tlabaty_app/test_view.dart';
// import 'package:tlabaty_app/view/screen/address/add.dart';
// import 'package:tlabaty_app/view/screen/address/adddetails.dart';
// import 'package:tlabaty_app/view/screen/address/view.dart';
import 'package:tlabaty_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:tlabaty_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:tlabaty_app/view/screen/auth/signup.dart';
import 'package:tlabaty_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:tlabaty_app/view/screen/auth/success_signup.dart';
import 'package:tlabaty_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:tlabaty_app/view/screen/auth/verifycodesignup.dart';
import 'package:tlabaty_app/view/screen/adv.dart';
// import 'package:tlabaty_app/view/screen/cart.dart';
// import 'package:tlabaty_app/view/screen/checkout.dart';
import 'package:tlabaty_app/view/screen/adv.dart';
import 'package:tlabaty_app/view/screen/homescreen.dart';
import 'package:tlabaty_app/view/screen/myorders.dart';
// import 'package:tlabaty_app/view/screen/items.dart';
// import 'package:tlabaty_app/view/screen/language.dart';
// import 'package:tlabaty_app/view/screen/myfavorite.dart';
import 'package:tlabaty_app/view/screen/onboarding.dart';
// import 'package:tlabaty_app/view/screen/orders/archive.dart';
// import 'package:tlabaty_app/view/screen/orders/details.dart';
// import 'package:tlabaty_app/view/screen/orders/pending.dart';
// import 'package:tlabaty_app/view/screen/productdetails.dart';
import 'package:get/get.dart';
import 'package:tlabaty_app/view/screen/orders.dart';
import 'package:tlabaty_app/view/screen/viweaddorder.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const OnBoarding(),
    middlewares: [MyMiddleWare()],
  ),
  // GetPage(name: "/", page: () =>   TestView()),
  //   GetPage(name: AppRoute.cart, page: () => const Cart()),
  // //  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
    name: AppRoute.successResetpassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
    name: AppRoute.verfiyCodeSignUp,
    page: () => const VerfiyCodeSignUp(),
  ),
  GetPage(
    name: AppRoute.addressadd_sginup,
    page: () => const AddFirstAddress(),
  ),
  GetPage(
    name: AppRoute.addressadddetails_sginup,
    page: () => const AddFirstdetAddrees(),
  ),
  //
  GetPage(name: AppRoute.homescreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.ordersscreen, page: () => OrderPage()),
  GetPage(name: AppRoute.myorders, page: () => OrdersMessagesPage()),
  GetPage(name: AppRoute.viweaddorder, page: () => AddressViewOrder()),

  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(
    name: AppRoute.addressadddetails,
    page: () => const AddressAddDetails(),
  ),

  //   GetPage(name: AppRoute.items, page: () => const Items()),
  //   GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  //   GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  //   //

  //   GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  //   GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  //   GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  //   GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
];
