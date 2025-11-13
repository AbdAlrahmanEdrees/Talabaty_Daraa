import 'package:tlabaty_app/core/class/crud.dart';
import 'package:tlabaty_app/linkapi.dart';

class AdvData {
  Crud crud;
  AdvData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.adv, {});
    return response.fold((l) => l, (r) => r);
  }
}
