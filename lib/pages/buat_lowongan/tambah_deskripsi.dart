import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
var Ringkasan =
    "Hope your day's going well! Just wanted to say hi and see how you're doing. Let's catch up soon. Take care and have a fantastic day!";

class TambahDeskripsi extends StatefulWidget {
  const TambahDeskripsi({super.key});

  @override
  State<TambahDeskripsi> createState() => TambahDeskripsiState();
}

class TambahDeskripsiState extends State<TambahDeskripsi> {

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
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/postingan');
                    },
                    icon: const Icon(
                      Icons.west,
                      color: Colors.black,
                    ),
                    iconSize: 27,
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
                            text: 'Simpan',
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
              SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KotakKompetisi(),
                    KotakPosisi(),
                    KotakDeskripsi(),
                  ],
                ),
              )
            ],
          ),
        ),
       ),
    );
  }
}

class KotakKompetisi extends StatelessWidget {
    final _formKey = GlobalKey<FormState>();
    final KompetisiController = TextEditingController();

  @override
  Widget build(BuildContext){
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kompetisi',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  child: TextFormField(
                    controller: KompetisiController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        hintText: 'Masukkan kompetisi',
                    ),
                    style: const TextStyle(
                      fontSize: 12, fontFamily: 'Poppins'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class KotakPosisi extends StatelessWidget {
    final _formKey = GlobalKey<FormState>();
    final PosisiController = TextEditingController();

  @override
  Widget build(BuildContext){
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Posisi',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  child: TextFormField(
                    controller: PosisiController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        hintText: 'Masukkan posisi',
                    ),
                    style: const TextStyle(
                      fontSize: 12, fontFamily: 'Poppins'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class KotakDeskripsi extends StatelessWidget {
    final _formKey = GlobalKey<FormState>();
    final DeskripsiController = TextEditingController();

  @override
  Widget build(BuildContext){
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  child: TextFormField(
                    controller: DeskripsiController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0)
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        hintText: 'Masukkan deskripsi',
                    ),
                    style: const TextStyle(
                      fontSize: 12, fontFamily: 'Poppins'
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

