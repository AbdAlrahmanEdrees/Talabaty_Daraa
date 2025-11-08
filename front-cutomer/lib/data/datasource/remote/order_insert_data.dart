import 'package:tlabaty_app/core/class/crud.dart';
import 'package:tlabaty_app/linkapi.dart';

class OrderInsertData {
  Crud crud;
  OrderInsertData(this.crud);
  postdata(String email, String ordertext, String addess_id) async {
    var response = await crud.postData(AppLink.orderinsert, {
      "email": email,
      "orders_text": ordertext,
      "address_id": addess_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
