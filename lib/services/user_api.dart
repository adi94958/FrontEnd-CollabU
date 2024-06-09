import 'package:collab_u/model/user_profile.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<UserProfile> fetchUsers() async {
    const url = '$baseUrl/profil/1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final userProfile = UserProfile.fromJson(jsonData);
      return userProfile;
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  static Future<void> updateData(BuildContext context, String ringkasan) async {
    final url = Uri.parse('$baseUrl/profil/tentang-saya/1');
    final response = await http.put(
      url,
      body: {'tentang_saya': ringkasan},
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Berhasil diubah'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal mengubah data'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
