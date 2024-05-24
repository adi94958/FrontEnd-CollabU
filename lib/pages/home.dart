import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  late Map<String, dynamic> dataLowongan = {};
  late Map<String, dynamic> profileData = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    fetchDataLowongan();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Future<void> fetchDataProfile() async {
  //   final response =
  //       await http.get(Uri.parse(baseUrl + '/api/profil/1'));

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       profileData = json.decode(response.body);
  //     });
  //   } else {
  //     throw Exception('Failed to load profile data');
  //   }
  // }

  Future<void> fetchDataLowongan() async {
    final response =
        await http.get(Uri.parse(baseUrl + '/api/daftar-lowongan'));

    if (response.statusCode == 200) {
      setState(() {
        dataLowongan = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load lowongan data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F5F5),
        title: Row(
          children: [
            Expanded(
              flex: 5,
              child: RichText(
                textAlign: TextAlign.left,
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/notifikasi');
              },
              child: const Icon(
                Icons.notifications,
                size: 30,
                color: Color(0xFF524B6B),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profil');
                  },
                  child: profile(),
                ),
                Image.asset('assets/images/banner.png'),
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Daftar Lowongan',
                          style: TextStyle(
                            color: Color(0xFF150B3D),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/daftar_lowongan');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Lihat Semua',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFAAA6B9),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                buildJobItem(context),
                buildJobItem(context),
                buildJobItem(context),
                buildJobItem(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profile() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 45,
            child: Image.asset('assets/images/profile.png'),
          ),
        ),
        const Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Adi.',
                  style: TextStyle(
                    color: Color(0xFF150B3D),
                    fontSize: 14.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'D3 Teknik Informatika',
                  style: TextStyle(
                    color: Color(0xFFAAA6B9),
                    fontSize: 12.0,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: Image.asset('assets/images/arrow-right.png'),
          ),
        ),
      ],
    );
  }

  Widget buildJobItem(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataLowongan.isNotEmpty
                        ? dataLowongan['posisi']
                        : 'Loading...',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF150A33),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Pekan Kreatifitas Mahasiswa',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF524B6B),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    '2 Hari yang lalu',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF94929B),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => buildSheet(),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFfbded2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Lamar',
                    style: TextStyle(
                      color: Color(0xFF524B6B),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheet() => Stack(
        children: [
          DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.6,
            maxChildSize: 0.96,
            builder: (_, controller) => Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 10, right: 10),
              child: ListView(
                controller: controller,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E8E8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: Image.asset('assets/images/profile.png'),
                        ),
                      ),
                      const Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Adinda Raisa Azzahra',
                                style: TextStyle(
                                  color: Color(0xFF150B3D),
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'D3 Teknik Informatika',
                                style: TextStyle(
                                  color: Color(0xFFAAA6B9),
                                  fontSize: 12.0,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: const Center(
                      child: Column(
                        children: [
                          Text(
                            'UI / UX Designer',
                            style: TextStyle(
                              color: Color(0xFF2E3137),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Pekan Kreativitas Mahasiswa',
                            style: TextStyle(
                              color: Color(0xFF9EA1A5),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
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
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      indicatorPadding: const EdgeInsets.all(5),
                      labelColor: const Color(0xFF2E3137),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(
                          child: Text(
                            'Deskripsi',
                            style: TextStyle(
                              color: Color(0xFF2E3137),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Kualifikasi',
                            style: TextStyle(
                              color: Color(0xFF2E3137),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Job Desk',
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
                    height: 500,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        const SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            textAlign: TextAlign.justify,
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor. ',
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Jurusan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: [
                                    itemDataKualifikasi(
                                        'Teknik Komputer dan Informatika'),
                                    itemDataKualifikasi('Teknik Elektro'),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Program Studi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: [
                                    itemDataKualifikasi(
                                        'D3-Teknik Informatika'),
                                    itemDataKualifikasi(
                                        'D4-Teknik Informatika'),
                                    itemDataKualifikasi(
                                        'D3-Teknik Telekomunikasi'),
                                    itemDataKualifikasi(
                                        'D4-Teknik Telekomunikasi'),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Jenjang Pendidikan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: [
                                    itemDataKualifikasi('Tingkat 1'),
                                    itemDataKualifikasi('Tingkat 2'),
                                    itemDataKualifikasi('Tingkat 3'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          child: Wrap(
                            children: [
                              Text(
                                '1. Lorem ipsum dolor sit amet, consectetur elit.',
                              ),
                              Text(
                                '2. Lorem ipsum dolor sit amet, consectetur elit.',
                              ),
                              Text(
                                '3. Lorem ipsum dolor sit amet, consectetur elit.',
                              ),
                              Text(
                                '4. Lorem ipsum dolor sit amet, consectetur elit.',
                              ),
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9228),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Lamar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget itemDataKualifikasi(data) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      constraints: const BoxConstraints(
        minWidth: 0,
        maxWidth: double.infinity,
      ),
    );
  }
}
