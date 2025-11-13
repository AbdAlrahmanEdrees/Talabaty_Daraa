import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talabat_daraa/model/back_url.dart';

class AuthService {
  // static const String baseUrl = BackUrl.url; // Change as needed

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final Uri url = Uri.http(BackUrl.url, '/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {'success': true, 'data': data};
      } else {
        final error = jsonDecode(response.body);
        return {'success': false, 'message': error['message']};
      }
    } catch (e) {
      return {'success': false, 'message': 'Connection error'};
    }
  }
}
