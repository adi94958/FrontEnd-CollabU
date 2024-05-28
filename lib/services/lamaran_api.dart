import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LamaranService {
  static Future<List<Lowongan>> fetchLamaran() async {
    // static Future<List<Lowongan>> fetchLowongans(int id) async {
    final url = Uri.parse(
        '$baseUrl/daftar-lowongan/1'); //final url = Uri.parse('$baseUrl/daftar-lowongan/$id');
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
