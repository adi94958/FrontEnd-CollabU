import 'package:flutter/material.dart';
import 'package:collab_u/model/home/pelamar.dart';
import 'package:collab_u/services/manajemen_lamaran_services.dart';
import 'package:collab_u/widgets/callculate_time_ago.dart';

class ItemPelamar extends StatelessWidget {
  final Pelamar pelamar;

  const ItemPelamar({Key? key, required this.pelamar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                  child:
                      TimeAgoText(pelamar.tglLamar ?? 'default_date_string')),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png')),
                title: Row(
                  children: [
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${pelamar.pengguna.namaLengkap}\n',
                          style: const TextStyle(
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
                              "${pelamar.pengguna.profil.pendidikan.prodi.namaProdi}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black, // Warna teks
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
                children: [
                  ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: ('Ringkasan Pribadi\n'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF150B3D),
                                  ),
                                ),
                                WidgetSpan(
                                  child: SizedBox(
                                      height:
                                          20), // Menambahkan jarak vertical antara dua teks
                                ),
                                TextSpan(
                                  text:
                                      ('${pelamar.pengguna.profil.tentangSaya}\n'),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF524B6B),
                                  ),
                                ),
                                WidgetSpan(
                                  child: SizedBox(
                                      height:
                                          30), // Menambahkan jarak vertical antara dua teks
                                ),
                                TextSpan(
                                  text: ('Pengalaman\n'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF150B3D),
                                  ),
                                ),
                                WidgetSpan(
                                  child: SizedBox(height: 20),
                                ),
                                ...pelamar.pengguna.profil.pengalaman
                                    .asMap()
                                    .entries
                                    .map<InlineSpan>((entry) {
                                  int idx = entry.key + 1; // Index mulai dari 1
                                  var pengalaman = entry.value;
                                  return TextSpan(
                                    text:
                                        '$idx. ${pengalaman.posisi} di ${pengalaman.perusahaan} (${pengalaman.tglMulai} - ${pengalaman.tglSelesai})\n',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF524B6B),
                                    ),
                                  );
                                }).toList(),
                                WidgetSpan(
                                  child: SizedBox(
                                      height:
                                          30), // Menambahkan jarak vertical antara dua teks
                                ),
                                TextSpan(
                                  text: ('Keahlian\n'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF150B3D),
                                  ),
                                ),
                                WidgetSpan(
                                  child: SizedBox(
                                      height:
                                          20), // Menambahkan jarak vertical antara dua teks
                                ),
                                ...pelamar.pengguna.profil.keahlian
                                    .asMap()
                                    .entries
                                    .map<InlineSpan>((entry) {
                                  int idx = entry.key + 1; // Index mulai dari 1
                                  var keahlian = entry.value;
                                  return TextSpan(
                                    text: '$idx. ${keahlian.keahlian}\n',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF524B6B),
                                    ),
                                  );
                                }).toList(),
                                WidgetSpan(
                                  child: SizedBox(
                                      height:
                                          30), // Menambahkan jarak vertical antara dua teks
                                ),
                                TextSpan(
                                  text: ('Prestasi\n'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF150B3D),
                                  ),
                                ),
                                WidgetSpan(
                                  child: SizedBox(
                                      height:
                                          20), // Menambahkan jarak vertical antara dua teks
                                ),
                                ...pelamar.pengguna.profil.prestasi
                                    .asMap()
                                    .entries
                                    .map<InlineSpan>((entry) {
                                  int idx = entry.key + 1; // Index mulai dari 1
                                  var prestasi = entry.value;
                                  return TextSpan(
                                    text:
                                        '$idx. ${prestasi.kategori} di ${prestasi.namaPenghargaan} pada tahun ${prestasi.tahun}\n',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF524B6B),
                                    ),
                                  );
                                }).toList(),
                                WidgetSpan(
                                  child: SizedBox(
                                      height:
                                          30), // Menambahkan jarak vertical antara dua teks
                                ),
                                TextSpan(
                                  text: ('Resume'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF150B3D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F3F3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 30,
                                  child: Image.asset('assets/images/pdf.png'),
                                ),
                                Expanded(
                                  child: RichText(
                                    text: const TextSpan(
                                      text: ('Adinda Raiza Azahra - CV'),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF150B3D),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 30,
                                  child:
                                      Image.asset('assets/images/unduhPdf.png'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      try {
                                        await ManajemenLamaranService
                                            .tolakPelamar(pelamar.idPelamar);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('Pelamar ditolak')));
                                        // Update UI if needed
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Gagal menolak pelamar: $e')));
                                      }
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, left: 10),
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFF0404),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: const TextSpan(
                                          text: ('TOLAK'),
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      try {
                                        await ManajemenLamaranService
                                            .terimaPelamar(pelamar.idPelamar);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('Pelamar diterima')));
                                        // Update UI if needed
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Gagal menerima pelamar: $e')));
                                      }
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, left: 10),
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF05FF00),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: const TextSpan(
                                          text: ('TERIMA'),
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
