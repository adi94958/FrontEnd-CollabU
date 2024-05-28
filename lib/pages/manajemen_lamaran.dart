import 'package:collab_u/model/home/pelamar.dart';
import 'package:collab_u/services/manajemen_lamaran_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ManajemenLamaran extends StatefulWidget {
  final int idLowongan;

  const ManajemenLamaran({Key? key, required this.idLowongan})
      : super(key: key);

  @override
  _ManajemenLamaranState createState() => _ManajemenLamaranState();
}

class _ManajemenLamaranState extends State<ManajemenLamaran>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'UI/UX Designer',
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
                        'Hackathon Nasional 2024',
                        style: TextStyle(
                          color: Color(0xFF524B6B),
                          fontSize: 12,
                          fontFamily: 'Poppins',
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
                            widget.idLowongan),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No data available'));
                          } else {
                            return SingleChildScrollView(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: snapshot.data!
                                    .map((pelamar) => itemPelamar(pelamar))
                                    .toList(),
                              ),
                            );
                          }
                        },
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            itemDiterima(),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            itemDitolak(),
                          ],
                        ),
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

  Widget itemDitolak() {
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
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Muhammad Adi Saputera\n',
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
                    text: 'D3 Teknik Informatika',
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

  Widget itemDiterima() {
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
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Muhammad Adi Saputera\n',
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
                        text: 'D3 Teknik Informatika',
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
                child: RichText(
                  text: const TextSpan(
                    text: '1 Jam yang lalu',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFAAA6B9),
                    ),
                  ),
                ),
              ),
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
                          text: "D3 - Teknik Informatika",
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
                            text: const TextSpan(
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
                                      ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.\n'),
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
                                  child: SizedBox(
                                      height:
                                          20), // Menambahkan jarak vertical antara dua teks
                                ),
                                TextSpan(
                                  text:
                                      ('1. PKM Polban 2023\n2. Staff Muda BEM KEMA Polban 2023\n'),
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
                                TextSpan(
                                  text:
                                      ('Komunikasi, HTML5, PHP, ReactJS, Laravel\n'),
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
                                TextSpan(
                                  text:
                                      ('1. Juara 1 pengembangan aplikasi pertanian\n2. Lolos pendanaan PKM Belmawa 2024\n'),
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
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, right: 10),
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
                                Expanded(
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
