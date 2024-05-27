class Jurusan {
  int id;
  int idLowongan;
  String nama_jurusan;

  Jurusan({
    required this.id,
    required this.idLowongan,
    required this.nama_jurusan,
  });

  factory Jurusan.fromJson(Map<String, dynamic> json) {
    return Jurusan(
      id: json['id'],
      idLowongan: json['id_lowongan'],
      nama_jurusan: json['jurusan']['nama_jurusan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_lowongan': idLowongan,
      'nama_jurusan': nama_jurusan,
    };
  }
}
