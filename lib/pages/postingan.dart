import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Postingan extends StatefulWidget {
  const Postingan({Key? key}) : super(key: key);

  @override
  State<Postingan> createState() => _PostinganState();
}

class _PostinganState extends State<Postingan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5F5),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
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
                            text: 'Post',
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
                    'Tambahkan Lowongan',
                    style: TextStyle(
                      color: Color(0xFF150B3D),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Spacer
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Kotak(text: 'Deskripsi'),
                    Kotak(text: 'Kualifikasi'),
                    Kotak(text: 'Job Desk'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Kotak extends StatelessWidget{
  final String text;

  Kotak({required this.text});

  @override
  Widget build (BuildContext context){
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF150A33),
                    fontSize: 14, 
                    fontWeight: FontWeight.bold, 
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Nanti tambahin disini
                }, 
                icon: Icon(LineAwesomeIcons.plus_circle),
                iconSize: 30,
                color: Colors.orange,
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}