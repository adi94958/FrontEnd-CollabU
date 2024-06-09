import 'package:flutter/material.dart';
import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/services/activity_services.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> with TickerProviderStateMixin {
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
        toolbarHeight: 90,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
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
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Riwayat Lamaran Saya',
                style: TextStyle(
                  color: Color(0xFF150B3D),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF6F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                          0,
                          2,
                        ), // perubahan bayangan diatur di sini
                      ),
                    ],
                  ),
                  indicatorPadding: const EdgeInsets.all(5),
                  labelColor: const Color(0xFF2E3137),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Proses',
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
                    // Tab "Proses"
                    FutureBuilder<List<Lowongan>?>(
                      future: ManajemenActivityService.fetchLamaranDiproses(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          print('Failed to load data: ${snapshot.error}');
                          return Center(
                              child:
                                  Text('Failed to load data')); // Error display
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(
                              child: Text('Tidak ada lamaran diproses'));
                        } else {
                          return SingleChildScrollView(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: snapshot.data!.map((lowongan) {
                                return itemProses(lowongan);
                              }).toList(),
                            ),
                          );
                        }
                      },
                    ),
                    // Tab "Diterima"
                    FutureBuilder<List<Lowongan>?>(
                      future: ManajemenActivityService.fetchLamaranDiterima(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          print('Failed to load data: ${snapshot.error}');
                          return Center(child: Text('Failed to load data'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(
                              child: Text('Tidak ada lamaran diterima'));
                        } else {
                          return SingleChildScrollView(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: snapshot.data!.map((lowongan) {
                                return itemDiterima(lowongan);
                              }).toList(),
                            ),
                          );
                        }
                      },
                    ),
                    // Tab "Ditolak"
                    FutureBuilder<List<Lowongan>?>(
                      future: ManajemenActivityService.fetchLamaranDitolak(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          print('Failed to load data: ${snapshot.error}');
                          return Center(child: Text('Failed to load data'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(
                              child: Text('Tidak ada lamaran ditolak'));
                        } else {
                          return SingleChildScrollView(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: snapshot.data!.map((lowongan) {
                                return itemDitolak(lowongan);
                              }).toList(),
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
    );
  }

  Widget itemDitolak(Lowongan lowongan) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${lowongan.posisi}\n',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(child: SizedBox(height: 20)),
                  TextSpan(
                    text: '${lowongan.kompetisi}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
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

  Widget itemDiterima(Lowongan lowongan) {
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
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${lowongan.posisi}\n',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(child: SizedBox(height: 20)),
                      TextSpan(
                        text: '${lowongan.kompetisi}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
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
                child: GestureDetector(
                  onTap: () {
                    // Add action to handle contact logic
                  },
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
                        text: 'HUBUNGI PEMBUAT LAMARAN',
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
        ],
      ),
    );
  }

  Widget itemProses(Lowongan lowongan) {
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
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    child: RichText(
                      text: const TextSpan(
                        text: '1 Jam yang lalu', // Calculate time ago here
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFAAA6B9),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${lowongan.posisi}\n',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(child: SizedBox(height: 20)),
                        TextSpan(
                          text: '${lowongan.kompetisi}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
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
