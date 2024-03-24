import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    color: Colors.red,
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
                    color: Colors.blue,
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
                    height: 50,
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.red,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.blue,
                    child: Text(
                      'Daftar Lowongan', // Teks yang ingin ditampilkan
                      style: TextStyle(
                        color: Color(0xFF150B3D), // Warna teks
                        fontSize: 16, // Ukuran teks
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.blue,
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
                  color: Colors.red, // Warna latar belakang container
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.red, // Warna latar belakang container
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.red, // Warna latar belakang container
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.red, // Warna latar belakang container
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
