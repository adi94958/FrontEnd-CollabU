class UserProdi {
  int? idProdi;
  int? idJurusan;
  String? namaProdi;
  String? createdAt;
  String? updatedAt;

  UserProdi(
      {this.idProdi,
      this.idJurusan,
      this.namaProdi,
      this.createdAt,
      this.updatedAt});

  UserProdi.fromJson(Map<String, dynamic> json) {
    idProdi = json['id_prodi'];
    idJurusan = json['id_jurusan'];
    namaProdi = json['nama_prodi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_prodi'] = idProdi;
    data['id_jurusan'] = idJurusan;
    data['nama_prodi'] = namaProdi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  bool get isNotEmpty {
    return idProdi != 0;
  }
}
