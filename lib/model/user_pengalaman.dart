class UserPengalaman {
  final int id;
  final int idProfil;
  final String tglMulai;
  final String tglSelesai;
  final String posisi;
  final String perusahaan;

  UserPengalaman({
    required this.id,
    required this.idProfil,
    required this.tglMulai,
    required this.tglSelesai,
    required this.posisi,
    required this.perusahaan,
  });

  factory UserPengalaman.fromJson(Map<String, dynamic> json) {
    return UserPengalaman(
      id: json['id'] ?? '',
      idProfil: json['id_profil'] ?? '',
      tglMulai: json['tgl_mulai'] ?? '',
      tglSelesai: json['tgl_selesai'] ?? '',
      posisi: json['posisi'] ?? '',
      perusahaan: json['perusahaan'] ?? '',
    );
  }
}
