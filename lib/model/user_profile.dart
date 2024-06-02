import 'package:collab_u/model/user.dart';
import 'package:collab_u/model/user_keahlian.dart';
import 'package:collab_u/model/user_pendidikan.dart';
import 'package:collab_u/model/user_pengalaman.dart';
import 'package:collab_u/model/user_prestasi.dart';

class UserProfile {
  int? idProfil;
  int? idPengguna;
  String? tentangSaya;
  String? resume;
  String? createdAt;
  String? updatedAt;
  User? pengguna;
  UserPendidikan? pendidikan;
  List<UserPrestasi>? prestasi;
  List<UserPengalaman>? pengalaman;
  List<UserKeahlian>? keahlian;

  UserProfile(
      {this.idProfil,
      this.idPengguna,
      this.tentangSaya,
      this.resume,
      this.createdAt,
      this.updatedAt,
      this.pengguna,
      this.pendidikan,
      this.prestasi,
      this.pengalaman,
      this.keahlian});

  UserProfile.fromJson(Map<String, dynamic> json) {
    idProfil = json['id_profil'];
    idPengguna = json['id_pengguna'];
    tentangSaya = json['tentang_saya'];
    resume = json['resume'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pengguna =
        json['pengguna'] != null ? User.fromJson(json['pengguna']) : null;
    pendidikan = json['pendidikan'] != null
        ? UserPendidikan.fromJson(json['pendidikan'])
        : null;
    if (json['prestasi'] != null) {
      prestasi = <UserPrestasi>[];
      json['prestasi'].forEach((v) {
        prestasi!.add(UserPrestasi.fromJson(v));
      });
    }
    if (json['pengalaman'] != null) {
      pengalaman = <UserPengalaman>[];
      json['pengalaman'].forEach((v) {
        pengalaman!.add(UserPengalaman.fromJson(v));
      });
    }
    if (json['keahlian'] != null) {
      keahlian = <UserKeahlian>[];
      json['keahlian'].forEach((v) {
        keahlian!.add(UserKeahlian.fromJson(v));
      });
    }
  }

  get isEmpty => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_profil'] = idProfil;
    data['id_pengguna'] = idPengguna;
    data['tentang_saya'] = tentangSaya;
    data['resume'] = resume;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pengguna != null) {
      data['pengguna'] = pengguna!.toJson();
    }
    if (pendidikan != null) {
      data['pendidikan'] = pendidikan!.toJson();
    }
    if (prestasi != null) {
      data['prestasi'] = prestasi!.map((v) => v.toJson()).toList();
    }
    if (pengalaman != null) {
      data['pengalaman'] = pengalaman!.map((v) => v.toJson()).toList();
    }
    if (keahlian != null) {
      data['keahlian'] = keahlian!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
