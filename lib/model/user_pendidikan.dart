import 'package:collab_u/model/user_jurusan.dart';
import 'package:collab_u/model/user_prodi.dart';

class UserPendidikan {
  int id;
  int idProfil;
  int idJurusan;
  int idProdi;
  String tahunMasuk;
  String createdAt;
  String updatedAt;
  UserProdi prodi;
  UserJurusan jurusan;

  UserPendidikan({
    required this.id,
    required this.idProfil,
    required this.idJurusan,
    required this.idProdi,
    required this.tahunMasuk,
    required this.createdAt,
    required this.updatedAt,
    required this.prodi,
    required this.jurusan,
  });

  factory UserPendidikan.fromJson(Map<String, dynamic> json) {
    return UserPendidikan(
      id: json['id'] ?? 0,
      idProfil: json['id_profil'] ?? 0,
      idJurusan: json['id_jurusan'] ?? 0,
      idProdi: json['id_prodi'] ?? 0,
      tahunMasuk: json['tahun_masuk'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      prodi: UserProdi.fromJson(json['prodi'] ?? {}),
      jurusan: UserJurusan.fromJson(json['jurusan'] ?? {}),
    );
  }
}
