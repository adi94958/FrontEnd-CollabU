class Prodi {
  final int idProdi;
  final int idJurusan;
  final String namaProdi;

  Prodi({
    required this.idJurusan,
    required this.idProdi,
    required this.namaProdi,
  });

  factory Prodi.fromJson(Map<String, dynamic> json) {
    return Prodi(
      idProdi: json['id_prodi'] ?? 0,
      idJurusan: json['id_jurusan'] ?? 0,
      namaProdi: json['nama_prodi'] ?? '',
    );
  }
}
