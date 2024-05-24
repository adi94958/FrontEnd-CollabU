class UserPrestasi {
  final int id;
  final int idProfil;
  final String namaPenghargaan;
  final String kategori;
  final int tahun;

  UserPrestasi({
    required this.id,
    required this.idProfil,
    required this.namaPenghargaan,
    required this.kategori,
    required this.tahun,
  });

  factory UserPrestasi.fromJson(Map<String, dynamic> json) {
    return UserPrestasi(
      id: json['id'],
      idProfil: json['id_profil'],
      namaPenghargaan: json['nama_penghargaan'],
      kategori: json['kategori'],
      tahun: json['tahun'],
    );
  }
}
