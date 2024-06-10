class Kompetisi {
  int id;
  String? namaKompetisi;
  String? deskripsi;
  String? tglMulai;
  String? tglSelesai;

  Kompetisi({
    required this.id,
    required this.namaKompetisi,
    required this.deskripsi,
    required this.tglMulai,
    required this.tglSelesai,
  });

  factory Kompetisi.fromJson(Map<String, dynamic> json) {
    return Kompetisi(
      id: json['id'] ?? 0,
      namaKompetisi: json['nama_kompetisi'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      tglMulai: json['tgl_mulai'] ?? '',
      tglSelesai: json['tgl_selesai'] ?? '',
    );
  }
}
