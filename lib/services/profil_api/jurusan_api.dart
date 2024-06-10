import 'dart:convert';

import 'package:collab_u/model/user_jurusan.dart';
import 'package:collab_u/model/user_prodi.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:http/http.dart' as http;

class JurusanApi {
  static Future<List<UserJurusan>> fetchJurusanUsers() async {
    const url = '$baseUrl/jurusan';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  static Future<List<UserProdi>> fetchProdiUsers() async {
    const url = '$baseUrl/prodi';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to load user profile');
    }
  }
}
