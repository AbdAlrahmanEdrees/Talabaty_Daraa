import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talabat_daraa/model/user.dart';
import 'package:talabat_daraa/model/back_url.dart';

class CreateService {
  static Future<User> createUser({
    required String name,
    required String email,
    required String password,
    required String role,
    required String phone,
  }) async {
    final Uri url = Uri.http(BackUrl.url, '/users'); // Adjust endpoint if needed

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': name,
        'email': email,
        'password': password,
        'role': role,
        'phone': phone,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to create user');
    }
  }
}
