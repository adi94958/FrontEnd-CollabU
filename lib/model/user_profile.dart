import 'package:collab_u/model/user.dart';
import 'package:collab_u/model/user_keahlian.dart';
import 'package:collab_u/model/user_pendidikan.dart';
import 'package:collab_u/model/user_pengalaman.dart';
import 'package:collab_u/model/user_prestasi.dart';

class UserProfile {
  int idProfil;
  int idPengguna;
  String tentangSaya;
  String resume;
  DateTime? createdAt;
  DateTime? updatedAt;
  User pengguna;
  List<UserPendidikan> pendidikan;
  List<UserPrestasi> prestasi;
  List<UserPengalaman> pengalaman;
  List<UserKeahlian> keahlian;

  UserProfile({
    required this.idProfil,
    required this.idPengguna,
    required this.tentangSaya,
    required this.resume,
    required this.createdAt,
    required this.updatedAt,
    required this.pengguna,
    required this.pendidikan,
    required this.prestasi,
    required this.pengalaman,
    required this.keahlian,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      idProfil: json['id_profil'] ?? 0,
      idPengguna: json['id_pengguna'] ?? 0,
      tentangSaya: json['tentang_saya'] ?? '',
      resume: json['resume'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pengguna: User.fromJson(json['pengguna'] ?? {}),
      pendidikan: (json['pendidikan'] as List<dynamic>?)
              ?.map((item) => UserPendidikan.fromJson(item))
              .toList() ??
          [],
      prestasi: (json['prestasi'] as List<dynamic>?)
              ?.map((item) => UserPrestasi.fromJson(item))
              .toList() ??
          [],
      pengalaman: (json['pengalaman'] as List<dynamic>?)
              ?.map((item) => UserPengalaman.fromJson(item))
              .toList() ??
          [],
      keahlian: (json['keahlian'] as List<dynamic>?)
              ?.map((item) => UserKeahlian.fromJson(item))
              .toList() ??
          [],
    );
  }
}
