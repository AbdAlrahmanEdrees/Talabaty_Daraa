import 'package:tlabaty_app/core/class/crud.dart';
import 'package:tlabaty_app/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String password ,String email ,String phone ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username , 
      "password" : password  , 
      "email" : email , 
      "phone" : phone  , 
    });

    print(response);
    
    return response.fold((l) => l, (r) => r);
  }
}
