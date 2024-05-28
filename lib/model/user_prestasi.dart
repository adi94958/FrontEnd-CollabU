class UserPrestasi {
  int id;
  int idProfil;
  String namaPenghargaan;
  String kategori;
  int tahun;
  String deskripsi;
  String createdAt;
  String updatedAt;

  UserPrestasi({
    required this.id,
    required this.idProfil,
    required this.namaPenghargaan,
    required this.kategori,
    required this.tahun,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserPrestasi.fromJson(Map<String, dynamic> json) {
    return UserPrestasi(
      id: json['id'] ?? 0,
      idProfil: json['id_profil'] ?? 0,
      namaPenghargaan: json['nama_penghargaan'] ?? '',
      kategori: json['kategori'] ?? '',
      tahun: json['tahun'] ?? 0,
      deskripsi: json['deskripsi'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
