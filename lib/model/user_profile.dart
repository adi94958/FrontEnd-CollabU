import 'package:collab_u/model/user.dart';
import 'package:collab_u/model/user_keahlian.dart';
import 'package:collab_u/model/user_pendidikan.dart';
import 'package:collab_u/model/user_pengalaman.dart';
import 'package:collab_u/model/user_prestasi.dart';

class UserProfile {
  final int idProfil;
  final int idPengguna;
  final String tentangSaya;
  final dynamic resume;
  final User pengguna;
  final List<UserPendidikan> pendidikan;
  final List<UserPrestasi> prestasi;
  final List<UserPengalaman> pengalaman;
  final List<UserKeahlian> keahlian;

  UserProfile({
    required this.idProfil,
    required this.idPengguna,
    required this.tentangSaya,
    required this.resume,
    required this.pengguna,
    required this.pendidikan,
    required this.prestasi,
    required this.pengalaman,
    required this.keahlian,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      idProfil: json['id_profil'] ?? '',
      idPengguna: json['id_pengguna'] ?? '',
      tentangSaya: json['tentang_saya'] ?? '',
      resume: json['resume'] ?? '',
      pengguna: User.fromJson(json['pengguna']),
      pendidikan: json['pendidikan'] == null
          ? json['pendidikan']
          : List<UserPendidikan>.from(
              json['pendidikan'].map((x) => UserPendidikan.fromJson(x))),
      prestasi: json['prestasi'] == null
          ? []
          : List<UserPrestasi>.from(
              json['prestasi'].map((x) => UserPrestasi.fromJson(x))),
      pengalaman: json['pengalaman'] == null
          ? []
          : List<UserPengalaman>.from(
              json['pengalaman'].map((x) => UserPengalaman.fromJson(x))),
      keahlian: json['keahlian'] == null
          ? []
          : List<UserKeahlian>.from(
              json['keahlian'].map((x) => UserKeahlian.fromJson(x))),
    );
  }
}
