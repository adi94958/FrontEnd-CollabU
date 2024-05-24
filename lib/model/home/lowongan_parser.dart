import 'dart:convert';

import 'package:collab_u/model/home/lowongan.dart';

List<Lowongan> lowonganFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Lowongan>.from(jsonData.map((x) => Lowongan.fromJson(x)));
}

String lowonganToJson(List<Lowongan> data) {
  final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}
