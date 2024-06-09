import 'package:flutter/material.dart';
import 'package:collab_u/model/home/pelamar.dart';

class ItemDitolak extends StatelessWidget {
  final Pelamar pelamarDitolak;

  const ItemDitolak({Key? key, required this.pelamarDitolak}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 45,
                child: Image.asset('assets/images/profile.png'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${pelamarDitolak.pengguna.namaLengkap}\n',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Warna teks
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                            height:
                                20), // Menambahkan jarak vertical antara dua teks
                      ),
                      TextSpan(
                        text:
                            "${pelamarDitolak.pengguna.profil.pendidikan.prodi.namaProdi}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black, // Warna teks
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
