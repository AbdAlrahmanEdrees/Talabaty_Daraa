import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talabat_daraa/model/back_url.dart';

class UserBanService {
  // static const String baseUrl = BackUrl.url;

  /// Sends a request to ban a user by ID
  static Future<Map<String, dynamic>> banUser(int userId) async {
    final Uri url = Uri.http(BackUrl.url, '/users/ban');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"userId": userId}),
      );

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'User banned successfully'};
      } else {
        final error = jsonDecode(response.body);
        return {
          'success': false,
          'message': error['message'] ?? 'Failed to ban user'
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Connection error'};
    }
  }
}
