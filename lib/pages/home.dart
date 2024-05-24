import 'package:collab_u/model/home/angkatan.dart';
import 'package:collab_u/model/home/jurusan.dart';
import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/model/home/prodi.dart';
import 'package:collab_u/services/loading_shimer_lowongan.dart';
import 'package:collab_u/services/lowongan_api.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
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

  String calculateTimeAgo(String dateString) {
    final DateTime date = DateTime.parse(dateString);
    final Duration difference = DateTime.now().difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} Hari yang lalu';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} Jam yang lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} Menit yang lalu';
    } else {
      return 'Baru saja';
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
                FutureBuilder<List<Lowongan>>(
                  future: LowonganService.fetchLowongans(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        children: List.generate(
                          5,
                          (index) => buildJobItemPlaceholderShimmer(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Center(child: Text('Failed to load data'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data available'));
                    } else {
                      return Column(
                        children: (snapshot.data!.take(5)).map((lowongan) {
                          return buildJobItem(
                            context,
                            lowongan.posisi,
                            lowongan.kompetisi,
                            lowongan.tglPosting,
                            lowongan.nama,
                            lowongan.prodi_perekrut,
                            lowongan.deskripsiKerja,
                            lowongan.deskripsi,
                            lowongan.jurusan,
                            lowongan.prodi,
                            lowongan.angkatan,
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
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

  Widget buildJobItem(
    BuildContext context,
    String posisi,
    String kompetisi,
    String tglPosting,
    String nama,
    String prodi_perekrut,
    String deskripsiKerja,
    String deskripsi,
    List<Jurusan> jurusanList,
    List<Prodi> prodiList,
    List<Angkatan> angkatanList,
  ) {
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
                    posisi,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF150A33),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    kompetisi,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF524B6B),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    calculateTimeAgo(tglPosting),
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
                  builder: (context) => buildSheet(
                    posisi,
                    kompetisi,
                    tglPosting,
                    nama,
                    prodi_perekrut,
                    deskripsiKerja,
                    deskripsi,
                    jurusanList,
                    prodiList,
                    angkatanList,
                  ),
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

  Widget buildSheet(
    String posisi,
    String kompetisi,
    String tglPosting,
    String nama,
    String prodi_perekrut,
    String deskripsiKerja,
    String deskripsi,
    List<Jurusan> jurusanList,
    List<Prodi> prodiList,
    List<Angkatan> angkatanList,
  ) =>
      Stack(
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
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nama,
                                style: const TextStyle(
                                  color: Color(0xFF150B3D),
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                prodi_perekrut,
                                style: const TextStyle(
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
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            posisi,
                            style: const TextStyle(
                              color: Color(0xFF2E3137),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            kompetisi,
                            style: const TextStyle(
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
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            textAlign: TextAlign.justify,
                            deskripsi,
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
                                  children: jurusanList.map((jurusan) {
                                    return itemDataKualifikasi(
                                        jurusan.nama_jurusan);
                                  }).toList(),
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
                                  children: prodiList.map((prodi) {
                                    return itemDataKualifikasi(
                                        prodi.nama_prodi);
                                  }).toList(),
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
                                  children: angkatanList.map((angkatan) {
                                    return itemDataKualifikasi(
                                        angkatan.angkatan);
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(10),
                          child: Wrap(
                            children: [
                              Text(
                                deskripsiKerja,
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
