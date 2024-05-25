class UserKeahlian {
  final int id;
  final String keahlian;
  final int idProfil;

  UserKeahlian({
    required this.id,
    required this.keahlian,
    required this.idProfil,
  });

  factory UserKeahlian.fromJson(Map<String, dynamic> json) {
    return UserKeahlian(
      id: json['id'] ?? '',
      keahlian: json['keahlian'] ?? '',
      idProfil: json['id_profil'] ?? '',
    );
  }
}
