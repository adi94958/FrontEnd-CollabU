import 'package:collab_u/model/home/pelamar.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManajemenLamaranService {
  static Future<List<Pelamar>> fetchManajemenLamaran(int idPelamar) async {
    final url = Uri.parse('$baseUrl/pelamar-lowongan/1'); //$idPelamar
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> pelamarJson = json.decode(response.body);
        return pelamarJson.map((json) => Pelamar.fromJson(json)).toList();
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
