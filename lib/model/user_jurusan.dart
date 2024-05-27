import 'package:collab_u/model/user_pt.dart';

class UserJurusan {
  int idJurusan;
  int idPt;
  String namaJurusan;
  String createdAt;
  String updatedAt;
  UserPerguruanTinggi perguruanTinggi;

  UserJurusan({
    required this.idJurusan,
    required this.idPt,
    required this.namaJurusan,
    required this.createdAt,
    required this.updatedAt,
    required this.perguruanTinggi,
  });

  factory UserJurusan.fromJson(Map<String, dynamic> json) {
    return UserJurusan(
      idJurusan: json['id_jurusan'] ?? 0,
      idPt: json['id_pt'] ?? 0,
      namaJurusan: json['nama_jurusan'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      perguruanTinggi:
          UserPerguruanTinggi.fromJson(json['perguruan_tinggi'] ?? {}),
    );
  }
}
