class User {
  final int idPengguna;
  final String email;
  final String password;
  final String namaLengkap;
  final String namaPanggilan;
  final String tanggalLahir;
  final String jenisKelamin;
  final String noTelp;
  final int idPt;

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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idPengguna: json['id_pengguna'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      namaLengkap: json['nama_lengkap'] ?? '',
      namaPanggilan: json['nama_panggilan'] ?? '',
      tanggalLahir: json['tanggal_lahir'] ?? '',
      jenisKelamin: json['jenis_kelamin'] ?? '',
      noTelp: json['no_telp'] ?? '',
      idPt: json['id_pt'] ?? '',
    );
  }
}
