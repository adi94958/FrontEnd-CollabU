import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:collab_u/model/home/profil_home.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPenggunaService {
  static Future<PenggunaHome> fetchPengguna() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id_pengguna = prefs.getString("id");
    final url = Uri.parse('$baseUrl/pengguna/$id_pengguna');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> penggunaJson = json.decode(response.body);
        return PenggunaHome.fromJson(penggunaJson);
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }
}
