import 'package:tlabaty_app/core/class/crud.dart';
import 'package:tlabaty_app/linkapi.dart';

class GetOrdersData {
  Crud crud;
  GetOrdersData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(AppLink.orderget, {"email": email});
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String id, String email) async {
    var response = await crud.postData(AppLink.orderdelete, {
      "order_id": id,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  editorder(String id, String email, String order_text) async {
    var response = await crud.postData(AppLink.orderedit, {
      "order_id": id,
      "email": email,
      "orders_text": order_text,
    });
    return response.fold((l) => l, (r) => r);
  }
}
