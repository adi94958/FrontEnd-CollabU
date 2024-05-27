class Angkatan {
  int id;
  int idLowongan;
  String angkatan;

  Angkatan({
    required this.id,
    required this.idLowongan,
    required this.angkatan,
  });

  factory Angkatan.fromJson(Map<String, dynamic> json) {
    return Angkatan(
      id: json['id'],
      idLowongan: json['id_lowongan'],
      angkatan: json['angkatan'],
    );
  }
}
