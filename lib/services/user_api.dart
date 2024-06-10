import 'dart:io';
import 'dart:typed_data';

import 'package:collab_u/model/user_profile.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  static Future<UserProfile> fetchUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString("id");
    print(id);
    final url = '$baseUrl/profil/$id';
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    final url = Uri.parse('$baseUrl/profil/tentang-saya/$id');
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

  static Future<Uint8List?> getImageUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    final response = await http.get(Uri.parse('$baseUrl/getImage/$id'));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }

  static Future<void> editProfil(
      BuildContext context, Map<String, dynamic> profil) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    try {
      final url = '$baseUrl/lengkapi-akun/$id';
      final Uri uri = Uri.parse(url);
      final http.Response response = await http.put(
        uri,
        body: profil,
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
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Terjadi kesalahan saat mengirim permintaan'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  static Future<void> editProfilwithImage(
      BuildContext context, Map<String, dynamic> profil, File file) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    try {
      final responses = await uploadImage(file);
      final url = '$baseUrl/lengkapi-akun/$id';
      final Uri uri = Uri.parse(url);
      final http.Response response = await http.put(
        uri,
        body: profil,
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
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Terjadi kesalahan saat mengirim permintaan'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  static Future uploadImage(File imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    final url = Uri.parse('$baseUrl/foto-profil/unggah/$id');
    final request = http.MultipartRequest('POST', url)
      ..files.add(
          await http.MultipartFile.fromPath('foto_profil', imageFile.path));

    final response = await request.send();
  }
}
