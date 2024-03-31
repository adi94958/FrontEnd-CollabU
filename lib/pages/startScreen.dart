import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    RichText(
                      textAlign: TextAlign.center, // Menyamakan teks ke tengah
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
                              color: Color(0xFF120A8F),
                            ), // Warna biru untuk "Collab"
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
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                    width: double.infinity,
                    child: Image.asset('assets/images/start_screen.png')),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: 300,
                        height: 90,
                        child: Text(
                          "Cari Rekan Tim Kamu Sekarang!",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30.0, // Ukuran font 20
                            fontFamily: 'Poppins', // Font family Poppins
                            fontWeight: FontWeight.bold, // Teks tebal
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 100,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Jelajahi untuk menemukan rekan berdasarkan kebutuhan dan jurusan yang anda inginkan.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14.0, // Ukuran font 20
                            fontFamily: 'Poppins', // Font family Poppins
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 50, right: 10),
                      child: IconButton(
                        onPressed: () {
                          // Navigate to the HomeScreen
                          Navigator.pushReplacementNamed(context, '/navbar');
                        },
                        iconSize: 40,
                        icon: const Icon(Icons.arrow_forward),
                        style: IconButton.styleFrom(
                          foregroundColor: Color(0xFFF9F9F9),
                          backgroundColor: Color(0xFF120A8F),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
