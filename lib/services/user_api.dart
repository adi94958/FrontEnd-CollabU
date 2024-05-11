import 'package:collab_u/model/user_profile.dart';
import 'package:collab_u/services/url_global.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<UserProfile>> fetchUsers() async {
    const url = '$baseUrl/profil/1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final userProfile = UserProfile.fromJson(jsonData);
      return [userProfile];
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }
}
