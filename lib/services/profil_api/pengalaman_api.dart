import 'package:collab_u/services/url_global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PengalamanApi {
  static Future<void> deletePengalaman(BuildContext context, int id) async {
    final String idApi = id.toString();
    final url = '$baseUrl/profil/pengalaman/hapus/$idApi';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Berhasil dihapus'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal menghapus data'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  static Future<void> editPengalaman(
      BuildContext context, Map<String, dynamic> pengalaman, int id) async {
    final String idApi = id.toString();

    try {
      final url = '$baseUrl/profil/pengalaman/edit/$idApi';
      final Uri uri = Uri.parse(url);
      final http.Response response = await http.put(
        uri,
        body: pengalaman,
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

  static Future<void> tambahPengalaman(
      BuildContext context, Map<String, dynamic> pengalaman) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    final url = Uri.parse('$baseUrl/profil/pengalaman/$id');
    final response = await http.post(
      url,
      body: pengalaman,
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Berhasil ditambah'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal menambah data'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
