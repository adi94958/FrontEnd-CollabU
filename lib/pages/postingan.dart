import 'package:flutter/material.dart';

class Postingan extends StatefulWidget {
  const Postingan({super.key});

  @override
  State<Postingan> createState() => _PostinganState();
}

class _PostinganState extends State<Postingan> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Postingan'),
      ),
    );
  }
}
