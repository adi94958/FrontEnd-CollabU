class UserPengalaman {
  int? id;
  int? idProfil;
  String? tglMulai;
  String? tglSelesai;
  String? posisi;
  String? perusahaan;
  String? createdAt;
  String? updatedAt;

  UserPengalaman(
      {this.id,
      this.idProfil,
      this.tglMulai,
      this.tglSelesai,
      this.posisi,
      this.perusahaan,
      this.createdAt,
      this.updatedAt});

  UserPengalaman.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProfil = json['id_profil'];
    tglMulai = json['tgl_mulai'];
    tglSelesai = json['tgl_selesai'];
    posisi = json['posisi'];
    perusahaan = json['perusahaan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_profil'] = idProfil;
    data['tgl_mulai'] = tglMulai;
    data['tgl_selesai'] = tglSelesai;
    data['posisi'] = posisi;
    data['perusahaan'] = perusahaan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
