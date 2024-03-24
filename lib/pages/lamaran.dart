import 'package:flutter/material.dart';

class Lamaran extends StatefulWidget {
  const Lamaran({super.key});

  @override
  State<Lamaran> createState() => _LamaranState();
}

class _LamaranState extends State<Lamaran> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Lamaran'),
      ),
    );
  }
}
