class Prodi {
  int id;
  int idLowongan;
  int idProdi;

  Prodi({
    required this.id,
    required this.idLowongan,
    required this.idProdi,
  });

  factory Prodi.fromJson(Map<String, dynamic> json) {
    return Prodi(
      id: json['id'],
      idLowongan: json['id_lowongan'],
      idProdi: json['id_prodi'],
    );
  }
}
