import 'package:collab_u/model/home/pengguna.dart';

class Pelamar {
  final int idPelamar;
  final int idPengguna;
  final int idLowongan;
  final String status;
  final Pengguna pengguna;

  Pelamar({
    required this.idPelamar,
    required this.idPengguna,
    required this.idLowongan,
    required this.status,
    required this.pengguna,
  });

  factory Pelamar.fromJson(Map<String, dynamic> json) {
    return Pelamar(
      idPelamar: json['id_pelamar'],
      idPengguna: json['id_pengguna'],
      idLowongan: json['id_lowongan'],
      status: json['status'],
      pengguna: Pengguna.fromJson(json['pengguna']),
    );
  }
}
