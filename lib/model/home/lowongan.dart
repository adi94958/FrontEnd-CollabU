import 'package:collab_u/model/home/angkatan.dart';
import 'package:collab_u/model/home/jurusan.dart';
import 'package:collab_u/model/home/prodi.dart';

class Lowongan {
  int idLowongan;
  String deskripsi;
  String posisi;
  String kompetisi;
  String deskripsiKerja;
  int idPengguna;
  String tglPosting;
  String? tglEdit;
  List<Jurusan> jurusan;
  List<Prodi> prodi;
  List<Angkatan> angkatan;
  String nama;
  String prodi_perekrut;
  String status;

  Lowongan({
    required this.idLowongan,
    required this.deskripsi,
    required this.posisi,
    required this.kompetisi,
    required this.deskripsiKerja,
    required this.idPengguna,
    required this.tglPosting,
    this.tglEdit,
    required this.jurusan,
    required this.prodi,
    required this.angkatan,
    required this.nama,
    required this.prodi_perekrut,
    required this.status,
  });

  factory Lowongan.fromJson(Map<String, dynamic> json) {
    return Lowongan(
      idLowongan: json['id_lowongan'],
      deskripsi: json['deskripsi'],
      posisi: json['posisi'],
      kompetisi: json['kompetisi'],
      deskripsiKerja: json['deskripsi_kerja'],
      idPengguna: json['id_pengguna'],
      tglPosting: json['created_at'],
      tglEdit: json['updated_at'],
      jurusan:
          List<Jurusan>.from(json['jurusan'].map((x) => Jurusan.fromJson(x))),
      prodi: List<Prodi>.from(json['prodi'].map((x) => Prodi.fromJson(x))),
      angkatan: List<Angkatan>.from(
          json['angkatan'].map((x) => Angkatan.fromJson(x))),
      nama: json['pengguna']['nama_lengkap'],
      prodi_perekrut: json['pengguna']['prodi']['nama_prodi'],
      status: json['status'],
    );
  }
}
