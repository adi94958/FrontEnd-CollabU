import 'package:collab_u/model/user_pt.dart';

class UserJurusan {
  int? idJurusan;
  int? idPt;
  String? namaJurusan;
  String? createdAt;
  String? updatedAt;
  UserPerguruanTinggi? perguruantinggi;

  UserJurusan(
      {this.idJurusan,
      this.idPt,
      this.namaJurusan,
      this.createdAt,
      this.updatedAt,
      this.perguruantinggi});

  UserJurusan.fromJson(Map<String, dynamic> json) {
    idJurusan = json['id_jurusan'];
    idPt = json['id_pt'];
    namaJurusan = json['nama_jurusan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    perguruantinggi = json['perguruantinggi'] != null
        ? UserPerguruanTinggi.fromJson(json['perguruantinggi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_jurusan'] = idJurusan;
    data['id_pt'] = idPt;
    data['nama_jurusan'] = namaJurusan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (perguruantinggi != null) {
      data['perguruantinggi'] = perguruantinggi!.toJson();
    }
    return data;
  }
}
