import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ManajemenActivityService {
  static Future<List<Lowongan>>? fetchLamaranDiproses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id_pengguna = prefs.getString("id");
    final url = Uri.parse('$baseUrl/lowongan/diproses/$id_pengguna');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> lowonganJson = json.decode(response.body);
        return lowonganJson.map((json) => Lowongan.fromJson(json)).toList();
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Lowongan>>? fetchLamaranDiterima() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id_pengguna = prefs.getString("id");
    final url = Uri.parse('$baseUrl/lowongan/diterima/$id_pengguna');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> lowonganJson = json.decode(response.body);
        return lowonganJson.map((json) => Lowongan.fromJson(json)).toList();
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Lowongan>>? fetchLamaranDitolak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id_pengguna = prefs.getString("id");
    final url = Uri.parse('$baseUrl/lowongan/ditolak/$id_pengguna');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> lowonganJson = json.decode(response.body);
        return lowonganJson.map((json) => Lowongan.fromJson(json)).toList();
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
