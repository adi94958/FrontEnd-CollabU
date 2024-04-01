import 'package:flutter/material.dart';

class Lamaran extends StatefulWidget {
  const Lamaran({super.key});

  @override
  State<Lamaran> createState() => _LamaranState();
}

class _LamaranState extends State<Lamaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
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
                      child: RichText(
                        textAlign: TextAlign.right,
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
                  ],
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Manajemen Lowongan Saya',
                      style: TextStyle(
                        color: Color(0xFF150B3D),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
                daftarLowonganSaya(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget daftarLowonganSaya() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/');
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
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
              child: Container(
                alignment: Alignment.centerRight,
                height: 60,
                // color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset('assets/images/arrow-right.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
