import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
      // appBar: AppBar(title: const Text('Home Screen')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
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
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Color(0xFF524B6B),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, '/profil'); // Ubah routes ke profile
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
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
                  ),
                ),
                Image.asset('assets/images/banner.png'),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
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

  Widget buildJobItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'UI / UX Designer',
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
                // Panggil fungsi yang akan dijalankan saat tombol ditekan
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => buildSheet(),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFfbded2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
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

  Widget buildSheet() => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.6,
        maxChildSize: 0.96,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          child: ListView(
            controller: controller,
            children: [
              Center(
                child: Container(
                  width: 55,
                  height: 8,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                          // Container(
                          //   child: DefaultTabController(
                          //     length: 4,
                          //     child: child
                          //     ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
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
              )
            ],
          ),
        ),
      );
}
