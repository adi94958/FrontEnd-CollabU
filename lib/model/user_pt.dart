class UserPerguruanTinggi {
  int? idPt;
  String? perguruanTinggi;
  String? createdAt;
  String? updatedAt;

  UserPerguruanTinggi(
      {this.idPt, this.perguruanTinggi, this.createdAt, this.updatedAt});

  UserPerguruanTinggi.fromJson(Map<String, dynamic> json) {
    idPt = json['id_pt'];
    perguruanTinggi = json['perguruan_tinggi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_pt'] = idPt;
    data['perguruan_tinggi'] = perguruanTinggi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
