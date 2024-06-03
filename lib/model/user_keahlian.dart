class UserKeahlian {
  int? id;
  String? keahlian;
  int? idProfil;

  UserKeahlian({this.id, this.keahlian, this.idProfil});

  UserKeahlian.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keahlian = json['keahlian'];
    idProfil = json['id_profil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['keahlian'] = keahlian;
    data['id_profil'] = idProfil;
    return data;
  }
}
