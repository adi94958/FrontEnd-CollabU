import 'package:collab_u/model/home/pelamar.dart';
import 'package:collab_u/services/manajemen_lamaran_services.dart';
import 'package:collab_u/widgets/callculate_time_ago.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ManajemenLamaran extends StatefulWidget {
  const ManajemenLamaran({super.key});

  @override
  _ManajemenLamaranState createState() => _ManajemenLamaranState();
}

class _ManajemenLamaranState extends State<ManajemenLamaran>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late int idLowongan;
  late String posisi;
  late String kompetisi;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
    idLowongan = arguments['idLowongan'];
    posisi = arguments['posisi'];
    kompetisi = arguments['kompetisi'];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F5F5),
        title: Align(
          alignment: Alignment.centerRight,
          child: RichText(
            textAlign: TextAlign.right,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Collab',
                  style: TextStyle(
                    color: Color(0xFF120A8F),
                  ),
                ),
                TextSpan(
                  text: 'U',
                  style: TextStyle(
                    color: Color(0xFFF1801B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF6F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            posisi,
                            style: TextStyle(
                              color: Color(0xFF150B3D),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            kompetisi,
                            style: TextStyle(
                              color: Color(0xFF524B6B),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 100),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await ManajemenLamaranService.tutupLowongan(
                              idLowongan);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Tutup lowongan berhasil'),
                          ));
                          setState(() {
                            Navigator.pushNamed(context, '/lamaran');
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Gagal menutup lowongan: $e'),
                          ));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Text(
                        'Tutup',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(
                              0, 2), // perubahan bayangan diatur di sini
                        ),
                      ],
                    ),
                    indicatorPadding: const EdgeInsets.all(5),
                    labelColor: const Color(0xFF2E3137),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(
                        child: Text(
                          'Pelamar',
                          style: TextStyle(
                            color: Color(0xFF2E3137),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Diterima',
                          style: TextStyle(
                            color: Color(0xFF2E3137),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Ditolak',
                          style: TextStyle(
                            color: Color(0xFF2E3137),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 650,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      FutureBuilder<List<Pelamar>>(
                        future: ManajemenLamaranService.fetchManajemenLamaran(
                            idLowongan),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('Tidak ada pelamar'));
                          } else {
                            final pelamarDiProses = snapshot.data!
                                .where(
                                    (pelamar) => pelamar.status == 'diproses')
                                .toList();

                            if (pelamarDiProses.isEmpty) {
                              return Center(child: Text('Tidak ada pelamar'));
                            }
                            return SingleChildScrollView(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: pelamarDiProses
                                    .map((pelamar) => itemPelamar(pelamar))
                                    .toList(),
                              ),
                            );
                          }
                        },
                      ),
                      FutureBuilder<List<Pelamar>>(
                        future: ManajemenLamaranService.fetchManajemenLamaran(
                            idLowongan),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('Tidak ada pelamar'));
                          } else {
                            // Filter pelamar yang statusnya "di proses"
                            final pelamarDiterima = snapshot.data!
                                .where(
                                    (pelamar) => pelamar.status == 'diterima')
                                .toList();

                            if (pelamarDiterima.isEmpty) {
                              return Center(
                                  child:
                                      Text('Tidak ada pelamar yang diterima'));
                            }
                            return SingleChildScrollView(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: pelamarDiterima
                                    .map((pelamar) => itemDiterima(pelamar))
                                    .toList(),
                              ),
                            );
                          }
                        },
                      ),
                      FutureBuilder<List<Pelamar>>(
                        future: ManajemenLamaranService.fetchManajemenLamaran(
                            idLowongan),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('Tidak ada pelamar'));
                          } else {
                            // Filter pelamar yang statusnya "di proses"
                            final pelamarDitolak = snapshot.data!
                                .where((pelamar) => pelamar.status == 'ditolak')
                                .toList();
                            if (pelamarDitolak.isEmpty) {
                              return Center(
                                  child:
                                      Text('Tidak ada pelamar yang ditolak'));
                            }
                            return SingleChildScrollView(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: pelamarDitolak
                                    .map((pelamar) => itemDitolak(pelamar))
                                    .toList(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemDitolak(Pelamar pelamarDitolak) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
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
                        '${pelamarDitolak.pengguna.profil.pendidikan?.prodi?.namaProdi ?? ''}',
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
    );
  }

  Widget itemDiterima(Pelamar pelamarDiterima) {
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
                            '${pelamarDiterima.pengguna.profil.pendidikan?.prodi?.namaProdi ?? ''}',
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

  Widget itemPelamar(Pelamar pelamar) {
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
                              '${pelamar.pengguna.profil.pendidikan?.prodi?.namaProdi ?? ''}',
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
                                ...(pelamar.pengguna.profil.pengalaman ?? [])
                                    .asMap()
                                    .entries
                                    .map<InlineSpan>((entry) {
                                  int idx =
                                      entry.key + 1; // Index starts from 1
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
                                ...(pelamar.pengguna.profil.keahlian ?? [])
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
                                ...(pelamar.pengguna.profil.prestasi ?? [])
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
                                        setState(() {
                                          // Lakukan pembaruan UI jika diperlukan
                                        });
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
                                        setState(() {
                                          // Lakukan pembaruan UI jika diperlukan
                                        });
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
