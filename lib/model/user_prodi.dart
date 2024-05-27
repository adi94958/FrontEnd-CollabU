class UserProdi {
  int idProdi;
  int idJurusan;
  String namaProdi;
  String createdAt;
  String updatedAt;

  UserProdi({
    required this.idProdi,
    required this.idJurusan,
    required this.namaProdi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProdi.fromJson(Map<String, dynamic> json) {
    return UserProdi(
      idProdi: json['id_prodi'] ?? 0,
      idJurusan: json['id_jurusan'] ?? 0,
      namaProdi: json['nama_prodi'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
