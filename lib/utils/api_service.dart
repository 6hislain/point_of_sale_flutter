import 'dart:convert';
import 'package:http/http.dart' as http;

import '../shared/constants.dart';

class APIService {
  Future<Map<String, dynamic>> fetchData({String path = ''}) async {
    final response = await http.get(Uri.parse('$backendAPI/$path'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<http.Response> postData({
    Map<String, dynamic> data = const {},
    String path = '',
  }) async {
    return await http.post(
      Uri.parse('$backendAPI/$path'),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
