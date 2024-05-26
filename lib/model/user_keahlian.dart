class UserKeahlian {
  int id;
  String keahlian;
  int idProfil;

  UserKeahlian({
    required this.id,
    required this.keahlian,
    required this.idProfil,
  });

  factory UserKeahlian.fromJson(Map<String, dynamic> json) {
    return UserKeahlian(
      id: json['id'] ?? 0,
      keahlian: json['keahlian'] ?? '',
      idProfil: json['id_profil'] ?? 0,
    );
  }
}
