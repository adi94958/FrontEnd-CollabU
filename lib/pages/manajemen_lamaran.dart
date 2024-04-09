import 'package:flutter/material.dart';

class ManajemenLamaran extends StatefulWidget {
  const ManajemenLamaran({super.key});

  @override
  State<ManajemenLamaran> createState() => _ManajemenLamaran();
}

class _ManajemenLamaran extends State<ManajemenLamaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.red,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/navbar');
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Color(0xFF524B6B),
                      ),
                    ),
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
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'UI/UX Desginer',
                      style: TextStyle(
                        color: Color(0xFF150B3D),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
