import 'package:collab_u/model/user_jurusan.dart';
import 'package:collab_u/model/user_prodi.dart';

class UserPendidikan {
  int? id;
  int? idProfil;
  int? idJurusan;
  int? idProdi;
  String? tahunMasuk;
  String? createdAt;
  String? updatedAt;
  UserProdi? prodi;
  UserJurusan? jurusan;

  UserPendidikan(
      {this.id,
      this.idProfil,
      this.idJurusan,
      this.idProdi,
      this.tahunMasuk,
      this.createdAt,
      this.updatedAt,
      this.prodi,
      this.jurusan});

  UserPendidikan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProfil = json['id_profil'];
    idJurusan = json['id_jurusan'];
    idProdi = json['id_prodi'];
    tahunMasuk = json['tahun_masuk'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    prodi = json['prodi'] != null ? UserProdi.fromJson(json['prodi']) : null;
    jurusan =
        json['jurusan'] != null ? UserJurusan.fromJson(json['jurusan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_profil'] = idProfil;
    data['id_jurusan'] = idJurusan;
    data['id_prodi'] = idProdi;
    data['tahun_masuk'] = tahunMasuk;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (prodi != null) {
      data['prodi'] = prodi!.toJson();
    }
    if (jurusan != null) {
      data['jurusan'] = jurusan!.toJson();
    }
    return data;
  }

  bool get isNotEmpty {
    return id != 0 &&
        idProfil != 0 &&
        idJurusan != 0 &&
        idProdi != 0 &&
        tahunMasuk.isNotEmpty &&
        createdAt.isNotEmpty &&
        updatedAt.isNotEmpty &&
        prodi.isNotEmpty &&
        jurusan.isNotEmpty;
  }
}
