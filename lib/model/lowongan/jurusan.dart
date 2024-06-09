class Jurusan {
  final int idJurusan;
  final int idPt;
  final String namaJurusan;

  Jurusan({
    required this.idPt,
    required this.idJurusan,
    required this.namaJurusan,
  });

  factory Jurusan.fromJson(Map<String, dynamic> json) {
    return Jurusan(
      idJurusan: json['id_jurusan'] ?? 0,
      idPt: json['id_pt'] ?? 0,
      namaJurusan: json['nama_jurusan'] ?? '',
    );
  }
}
