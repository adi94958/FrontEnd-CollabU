class UserPendidikan {
  final int id;
  final int idProfil;
  final int idJurusan;
  final int idProdi;
  final String tahunMasuk;

  UserPendidikan({
    required this.id,
    required this.idProfil,
    required this.idJurusan,
    required this.idProdi,
    required this.tahunMasuk,
  });

  factory UserPendidikan.fromJson(Map<String, dynamic> json) {
    return UserPendidikan(
      id: json['id'] ?? '',
      idProfil: json['id_profil'] ?? '',
      idJurusan: json['id_jurusan'] ?? '',
      idProdi: json['id_prodi'] ?? '',
      tahunMasuk: json['tahun_masuk'] ?? '',
    );
  }
}
