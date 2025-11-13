import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:talabat_daraa/model/back_url.dart';
import 'package:talabat_daraa/model/order.dart';

class OrdersReadService {
  static Future<List<Order>> fetchPendingOrders() async{
    final Uri url = Uri.http(BackUrl.url, '/orders/pending');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);      
      print("**************************************");
      print(data);
      return data.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }
  
  
  static Future<List<Order>> fetchCompletedOrders() async{
    final Uri url = Uri.http(BackUrl.url, '/orders/completed');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("**************************************");
      print(response.body);
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }
  
  static Future<List<Order>> fetchOnGoingOrders() async{
    final Uri url = Uri.http(BackUrl.url, '/orders/ongoing');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("**************************************");
      print(response.body);
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }
}
