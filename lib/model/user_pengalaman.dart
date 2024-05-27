class UserPengalaman {
  int id;
  int idProfil;
  String tglMulai;
  String tglSelesai;
  String posisi;
  String perusahaan;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserPengalaman({
    required this.id,
    required this.idProfil,
    required this.tglMulai,
    required this.tglSelesai,
    required this.posisi,
    required this.perusahaan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserPengalaman.fromJson(Map<String, dynamic> json) {
    return UserPengalaman(
      id: json['id'] ?? 0,
      idProfil: json['id_profil'] ?? 0,
      tglMulai: json['tgl_mulai'] ?? '',
      tglSelesai: json['tgl_selesai'] ?? '',
      posisi: json['posisi'] ?? '',
      perusahaan: json['perusahaan'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
