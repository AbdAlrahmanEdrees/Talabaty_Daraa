import 'package:tlabaty_app/core/constant/imageasset.dart';
import 'package:tlabaty_app/data/model/onboardingmodel.dart';
import 'package:get/get_utils/get_utils.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "طلباتي للتوصيل".tr,
    body: "تسوق بسهولة وخلي طلباتك توصلك أين ما كنت".tr,
    image: AppImageAsset.onBoardingImageOne,
  ),
  OnBoardingModel(
    title: "التسوق الذكي عبر الهاتف".tr,
    body:
        "تجربة تسوق عصرية وممتعة من خلال الهاتف، كل ما تحتاجه في متناول يدك بخطوات سهلة وسريعة"
            .tr,
    image: AppImageAsset.onBoardingImageTwo,
  ),
  OnBoardingModel(
    title: "توصيل سريع وآمن".tr,
    body: "خدمة توصيل مريحة تضمن وصول طلباتك بسرعة وأمان حتى باب منزلك".tr,
    image: AppImageAsset.onBoardingImageThree,
  ),

  // OnBoardingModel(
  //     title: "Fast Delivery",
  //     body:
  //         "We Have a 100k Product , Choose \n Your Product From Our E-commerce Shop",
  //     image: AppImageAsset.onBoardingImageFour),
];
