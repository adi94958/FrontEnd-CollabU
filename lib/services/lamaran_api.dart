import 'package:collab_u/model/home/pelamar.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LamaranService {
  static Future<List<Pelamar>> fetchManajemenPelamars(int idPelamar) async {
    final url = Uri.parse('$baseUrl/pelamar_lowongan/$idPelamar');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> lowonganJson = json.decode(response.body);
        return lowonganJson.map((json) => Pelamar.fromJson(json)).toList();
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
