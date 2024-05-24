import 'package:collab_u/model/Home/angkatan.dart';
import 'package:collab_u/model/Home/prodi.dart';

class Lowongan {
  int idLowongan;
  String deskripsi;
  String posisi;
  String kompetisi;
  String deskripsiKerja;
  int idPengguna;
  String tglPosting;
  String? tglEdit;
  List<Prodi> prodi;
  List<Angkatan> angkatan;

  Lowongan({
    required this.idLowongan,
    required this.deskripsi,
    required this.posisi,
    required this.kompetisi,
    required this.deskripsiKerja,
    required this.idPengguna,
    required this.tglPosting,
    this.tglEdit,
    required this.prodi,
    required this.angkatan,
  });

  factory Lowongan.fromJson(Map<String, dynamic> json) {
    return Lowongan(
      idLowongan: json['id_lowongan'],
      deskripsi: json['deskripsi'],
      posisi: json['posisi'],
      kompetisi: json['kompetisi'],
      deskripsiKerja: json['deskripsi_kerja'],
      idPengguna: json['id_pengguna'],
      tglPosting: json['tgl_posting'],
      tglEdit: json['tgl_edit'],
      prodi: List<Prodi>.from(json['prodi'].map((x) => Prodi.fromJson(x))),
      angkatan: List<Angkatan>.from(
          json['angkatan'].map((x) => Angkatan.fromJson(x))),
    );
  }
}
