import 'package:flutter/material.dart';

class DaftarLowongan extends StatefulWidget {
  const DaftarLowongan({super.key});

  @override
  State<DaftarLowongan> createState() => _DaftarLowonganState();
}

class _DaftarLowonganState extends State<DaftarLowongan> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Daftar Lowongan'),
      ),
    );
  }
}
