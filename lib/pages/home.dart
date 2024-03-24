import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Home Screen')),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    // color: Colors.red,
                    child: RichText(
                      textAlign: TextAlign.left, // Menyamakan teks ke tengah
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15.0, // Ukuran font
                          fontFamily: 'Poppins', // Font family
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'Collab',
                            style: TextStyle(
                                color: Color(
                                    0xFF120A8F)), // Warna biru untuk "Collab"
                          ),
                          TextSpan(
                            text: 'U',
                            style: TextStyle(
                              color: Color(0xFFF1801B),
                            ), // Warna orange untuk "U"
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.blue,
                    child: Icon(
                      Icons.notifications, // Icon bell
                      size: 30, // Ukuran ikon
                      color: Color(0xFF524B6B), // Warna ikon
                    ),
                  ),
                ),
              ],
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
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Halo, Adi.', // Teks yang ingin ditampilkan
                          style: TextStyle(
                            color: Color(0xFF150B3D), // Warna teks
                            fontSize: 14.0, // Ukuran teks
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'D3 Teknik Informatika', // Teks yang ingin ditampilkan
                          style: TextStyle(
                            color: Color(0xFFAAA6B9), // Warna teks
                            fontSize: 12.0, // Ukuran teks
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(18),
                    height: 50,
                    // color: Colors.yellow,
                    child: Image.asset('assets/images/arrow-right.png'),
                  ),
                ),
              ],
            ),
            Container(
              // color: Colors.red,
              child: Image.asset('assets/images/banner.png'),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    //color: Colors.blue,
                    child: Text(
                      'Daftar Lowongan', // Teks yang ingin ditampilkan
                      style: TextStyle(
                        color: Color(0xFF150B3D), // Warna teks
                        fontSize: 16, // Ukuran teks
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    //color: Colors.blue,
                    child: Text(
                      'Lihat Semua', // Teks yang ingin ditampilkan
                      textAlign: TextAlign.right, // Menempatkan teks di kanan
                      style: TextStyle(
                        color: Color(0xFFAAA6B9), // Warna teks
                        fontSize: 12, // Ukuran teks
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF), // Warna latar belakang container
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                        //color: Colors.blue,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  'UI / UX Designer', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF150A33), // Warna teks
                                    fontSize: 14, // Ukuran teks
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  'Pekan Kreatifitas Mahasiswa', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF524B6B), // Warna teks
                                    fontSize: 12, // Ukuran teks
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  '2 Hari yang lalu', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF94929B), // Warna teks
                                    fontSize: 10, // Ukuran teks
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(
                              0xFFfbded2), // Warna latar belakang container
                          borderRadius:
                              BorderRadius.circular(10), // Border radius
                        ),
                        child: Center(
                          child: Text(
                            'Lamar', // Teks yang ingin ditampilkan
                            style: TextStyle(
                              color: Color(0xFF524B6B), // Warna teks
                              fontSize: 12, // Ukuran teks
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF), // Warna latar belakang container
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                        //color: Colors.blue,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  'UI / UX Designer', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF150A33), // Warna teks
                                    fontSize: 14, // Ukuran teks
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  'Pekan Kreatifitas Mahasiswa', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF524B6B), // Warna teks
                                    fontSize: 12, // Ukuran teks
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  '2 Hari yang lalu', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF94929B), // Warna teks
                                    fontSize: 10, // Ukuran teks
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(
                              0xFFfbded2), // Warna latar belakang container
                          borderRadius:
                              BorderRadius.circular(10), // Border radius
                        ),
                        child: Center(
                          child: Text(
                            'Lamar', // Teks yang ingin ditampilkan
                            style: TextStyle(
                              color: Color(0xFF524B6B), // Warna teks
                              fontSize: 12, // Ukuran teks
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF), // Warna latar belakang container
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                        //color: Colors.blue,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  'UI / UX Designer', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF150A33), // Warna teks
                                    fontSize: 14, // Ukuran teks
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  'Pekan Kreatifitas Mahasiswa', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF524B6B), // Warna teks
                                    fontSize: 12, // Ukuran teks
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  '2 Hari yang lalu', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF94929B), // Warna teks
                                    fontSize: 10, // Ukuran teks
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(
                              0xFFfbded2), // Warna latar belakang container
                          borderRadius:
                              BorderRadius.circular(10), // Border radius
                        ),
                        child: Center(
                          child: Text(
                            'Lamar', // Teks yang ingin ditampilkan
                            style: TextStyle(
                              color: Color(0xFF524B6B), // Warna teks
                              fontSize: 12, // Ukuran teks
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF), // Warna latar belakang container
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                        //color: Colors.blue,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  'UI / UX Designer', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF150A33), // Warna teks
                                    fontSize: 14, // Ukuran teks
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  'Pekan Kreatifitas Mahasiswa', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF524B6B), // Warna teks
                                    fontSize: 12, // Ukuran teks
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                child: Text(
                                  '2 Hari yang lalu', // Teks yang ingin ditampilkan
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF94929B), // Warna teks
                                    fontSize: 10, // Ukuran teks
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(
                              0xFFfbded2), // Warna latar belakang container
                          borderRadius:
                              BorderRadius.circular(10), // Border radius
                        ),
                        child: Center(
                          child: Text(
                            'Lamar', // Teks yang ingin ditampilkan
                            style: TextStyle(
                              color: Color(0xFF524B6B), // Warna teks
                              fontSize: 12, // Ukuran teks
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
