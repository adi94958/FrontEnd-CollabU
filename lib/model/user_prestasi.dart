class UserPrestasi {
  int? id;
  int? idProfil;
  String? namaPenghargaan;
  String? kategori;
  int? tahun;
  String? deskripsi;
  String? createdAt;
  String? updatedAt;

  UserPrestasi(
      {this.id,
      this.idProfil,
      this.namaPenghargaan,
      this.kategori,
      this.tahun,
      this.deskripsi,
      this.createdAt,
      this.updatedAt});

  UserPrestasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProfil = json['id_profil'];
    namaPenghargaan = json['nama_penghargaan'];
    kategori = json['kategori'];
    tahun = json['tahun'];
    deskripsi = json['deskripsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_profil'] = idProfil;
    data['nama_penghargaan'] = namaPenghargaan;
    data['kategori'] = kategori;
    data['tahun'] = tahun;
    data['deskripsi'] = deskripsi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
