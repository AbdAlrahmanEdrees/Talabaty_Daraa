import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talabat_daraa/model/user.dart';
import 'package:talabat_daraa/model/back_url.dart';

class ReadService {
  static Future<List<User>> getUsers() async {
    final Uri url = Uri.http(BackUrl.url, '/users');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print("**************************************");
      print(data);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
