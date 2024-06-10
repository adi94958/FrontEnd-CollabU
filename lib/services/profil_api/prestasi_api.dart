import 'package:collab_u/pages/profil/prestasi/edit_prestasi.dart';
import 'package:collab_u/pages/profil/prestasi/tambah_prestasi.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PrestasiApi {
  static Future<void> deletePrestasi(BuildContext context, String id) async {
    final url = '$baseUrl/profil/prestasi/hapus/$id';
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

  static Future<void> editPrestasi(
      BuildContext context, Map<String, dynamic> prestasi, String id) async {
    try {
      final url = '$baseUrl/profil/prestasi/edit/$id';
      final Uri uri = Uri.parse(url);
      final http.Response response = await http.put(
        uri,
        body: prestasi,
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

  static Future<void> tambahPrestasi(
      BuildContext context, Map<String, dynamic> prestasi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    final url = Uri.parse('$baseUrl/profil/prestasi/$id');
    final response = await http.post(
      url,
      body: prestasi,
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
