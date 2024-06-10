import 'package:collab_u/services/url_global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LamarLowonganService {
  static Future<bool> checkProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id_pengguna = prefs.getString("id");
    final url = Uri.parse('$baseUrl/cek-profil/$id_pengguna');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['status'] ?? false;
      } else {
        print('Failed to check profile: ${response.statusCode}');
        throw Exception('Failed to check profile');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to check profile');
    }
  }

  static Future<bool> checkPelamar(int idLowongan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id_pengguna = prefs.getString("id");
    final url = Uri.parse('$baseUrl/cek-pelamar/$id_pengguna&$idLowongan');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['status'] ?? false;
      } else {
        print('Failed to check applicant: ${response.statusCode}');
        throw Exception('Failed to check applicant');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to check applicant');
    }
  }

  static Future<void> applyJob(int idLowongan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id_pengguna = prefs.getString("id");
    final url = Uri.parse('$baseUrl/daftar-pelamar');
    final body = json.encode({
      'id_pengguna': id_pengguna,
      'id_lowongan': idLowongan,
    });
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        print('Successfully applied for job');
        // Optionally, you can handle the response here
      } else {
        print('Failed to apply for job: ${response.statusCode}');
        throw Exception('Failed to apply for job');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to apply for job');
    }
  }
}
