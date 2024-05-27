class User {
  int idPengguna;
  String email;
  String password;
  String namaLengkap;
  String namaPanggilan;
  String tanggalLahir;
  String jenisKelamin;
  String noTelp;
  int idPt;
  int idJurusan;
  int idProdi;
  String createdAt;
  String updatedAt;

  User({
    required this.idPengguna,
    required this.email,
    required this.password,
    required this.namaLengkap,
    required this.namaPanggilan,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.noTelp,
    required this.idPt,
    required this.idJurusan,
    required this.idProdi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idPengguna: json['id_pengguna'] ?? 0,
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      namaLengkap: json['nama_lengkap'] ?? '',
      namaPanggilan: json['nama_panggilan'] ?? '',
      tanggalLahir: json['tanggal_lahir'] ?? '',
      jenisKelamin: json['jenis_kelamin'] ?? '',
      noTelp: json['no_telp'] ?? '',
      idPt: json['id_pt'] ?? 0,
      idJurusan: json['id_jurusan'] ?? 0,
      idProdi: json['id_prodi'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
