import 'package:flutter/material.dart';
import 'package:collab_u/model/home/pelamar.dart';

class ItemDiterima extends StatelessWidget {
  final Pelamar pelamarDiterima;

  const ItemDiterima({Key? key, required this.pelamarDiterima})
      : super(key: key);

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
                        text: '${pelamarDiterima.pengguna.namaLengkap}\n',
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
                            "${pelamarDiterima.pengguna.profil.pendidikan.prodi.namaProdi}",
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
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, right: 30, left: 30),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF130160),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: ('HUBUNGI PELAMAR'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
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
