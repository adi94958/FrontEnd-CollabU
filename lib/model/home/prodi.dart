class Prodi {
  int id;
  int idLowongan;
  int idProdi;
  String nama_prodi;

  Prodi({
    required this.id,
    required this.idLowongan,
    required this.idProdi,
    required this.nama_prodi,
  });

  factory Prodi.fromJson(Map<String, dynamic> json) {
    return Prodi(
      id: json['id'],
      idLowongan: json['id_lowongan'],
      idProdi: json['id_prodi'],
      nama_prodi: json['prodi']['nama_prodi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_lowongan': idLowongan,
      'id_prodi': idProdi,
      'nama_prodi': nama_prodi,
    };
  }
}
