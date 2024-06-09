import 'package:collab_u/model/home/pelamar.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManajemenLamaranService {
  static Future<List<Pelamar>> fetchManajemenLamaran(int idLowongan) async {
    final url = Uri.parse('$baseUrl/pelamar-lowongan/$idLowongan');
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

  static Future<void> terimaPelamar(int idPelamar) async {
    final url = Uri.parse('$baseUrl/terima-pelamar/$idPelamar');
    try {
      final response = await http.put(url);
      if (response.statusCode == 200) {
        print('Pelamar accepted successfully');
      } else {
        print('Failed to accept pelamar: ${response.statusCode}');
        throw Exception('Failed to accept pelamar');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to accept pelamar');
    }
  }

  static Future<void> tolakPelamar(int idPelamar) async {
    final url = Uri.parse('$baseUrl/tolak-pelamar/$idPelamar');
    try {
      final response = await http.put(url);
      if (response.statusCode != 200) {
        print('Failed to reject applicant: ${response.statusCode}');
        throw Exception('Failed to reject applicant');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to reject applicant');
    }
  }

  static Future<void> tutupLowongan(int idLowongan) async {
    final url = Uri.parse('$baseUrl/tutup-lowongan/$idLowongan');
    try {
      final response = await http.put(url);
      if (response.statusCode != 200) {
        print('Failed to reject applicant: ${response.statusCode}');
        throw Exception('Failed to reject applicant');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to reject applicant');
    }
  }
}
