class User {
  int? idPengguna;
  String? email;
  String? password;
  String? namaLengkap;
  String? namaPanggilan;
  String? tanggalLahir;
  String? jenisKelamin;
  String? noTelp;
  dynamic fotoProfil;
  int? idPt;
  int? idJurusan;
  int? idProdi;
  String? createdAt;
  String? updatedAt;

  User(
      {this.idPengguna,
      this.email,
      this.password,
      this.namaLengkap,
      this.namaPanggilan,
      this.tanggalLahir,
      this.jenisKelamin,
      this.noTelp,
      this.fotoProfil,
      this.idPt,
      this.idJurusan,
      this.idProdi,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    idPengguna = json['id_pengguna'];
    email = json['email'];
    password = json['password'];
    namaLengkap = json['nama_lengkap'];
    namaPanggilan = json['nama_panggilan'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    noTelp = json['no_telp'];
    fotoProfil = json['foto_profil'];
    idPt = json['id_pt'];
    idJurusan = json['id_jurusan'];
    idProdi = json['id_prodi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_pengguna'] = idPengguna;
    data['email'] = email;
    data['password'] = password;
    data['nama_lengkap'] = namaLengkap;
    data['nama_panggilan'] = namaPanggilan;
    data['tanggal_lahir'] = tanggalLahir;
    data['jenis_kelamin'] = jenisKelamin;
    data['no_telp'] = noTelp;
    data['foto_profil'] = fotoProfil;
    data['id_pt'] = idPt;
    data['id_jurusan'] = idJurusan;
    data['id_prodi'] = idProdi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
