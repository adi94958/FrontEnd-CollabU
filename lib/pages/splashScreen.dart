import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait for 2 seconds before navigating to the new screen
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the StartScreen
      Navigator.pushReplacementNamed(context, '/start');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF9F9F9),
        child: Center(
          child: Transform.scale(
            scale: 0.3, // Atur ukuran yang lebih kecil sesuai kebutuhan
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
