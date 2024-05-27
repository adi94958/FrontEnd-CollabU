class UserPerguruanTinggi {
  int idPt;
  String perguruanTinggi;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserPerguruanTinggi({
    required this.idPt,
    required this.perguruanTinggi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserPerguruanTinggi.fromJson(Map<String, dynamic> json) {
    return UserPerguruanTinggi(
      idPt: json['id_pt'] ?? 0,
      perguruanTinggi: json['perguruan_tinggi'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
