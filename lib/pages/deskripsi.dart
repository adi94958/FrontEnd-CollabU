import 'package:flutter/material.dart';

class Deskripsi extends StatefulWidget {
  const Deskripsi({super.key});

  @override
  State<Deskripsi> createState() => _DeskripsiState();
}

class _DeskripsiState extends State<Deskripsi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Deskripsi'),
      ),
    );
  }
}