import 'package:collab_u/model/home/jurusan.dart';
import 'package:collab_u/model/user_profile.dart';
import 'package:collab_u/model/user_pt.dart';
import 'package:collab_u/model/home/prodi.dart';
import 'package:collab_u/model/home/jurusan.dart';
import 'package:collab_u/model/home/angkatan.dart';

class Pengguna {
  final int idPengguna;
  final String email;
  final String password;
  final String namaLengkap;
  final String namaPanggilan;
  final String tanggalLahir;
  final String jenisKelamin;
  final String noTelp;
  final int idPT;
  final int idJurusan;
  final int idProdi;
  final UserProfile profil;
  // final Prodi? prodi;
  // final Jurusan jurusan;
  // final UserPerguruanTinggi perguruanTinggi;

  Pengguna({
    required this.idPengguna,
    required this.email,
    required this.password,
    required this.namaLengkap,
    required this.namaPanggilan,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.noTelp,
    required this.idPT,
    required this.idJurusan,
    required this.idProdi,
    required this.profil,
    // required this.prodi,
    // required this.jurusan,
    // required this.perguruanTinggi,
  });

  factory Pengguna.fromJson(Map<String, dynamic> json) {
    return Pengguna(
      idPengguna: json['id_pengguna'],
      email: json['email'],
      password: json['password'],
      namaLengkap: json['nama_lengkap'],
      namaPanggilan: json['nama_panggilan'],
      tanggalLahir: json['tanggal_lahir'],
      jenisKelamin: json['jenis_kelamin'],
      noTelp: json['no_telp'],
      idPT: json['id_pt'],
      idJurusan: json['id_jurusan'],
      idProdi: json['id_prodi'],
      profil: UserProfile.fromJson(json['profil']),
      // prodi: Prodi.fromJson(json['prodi']),
      // jurusan: Jurusan.fromJson(json['perguruantinggi']),
      // perguruanTinggi: UserPerguruanTinggi.fromJson(json['perguruantinggi']),
    );
  }
}
