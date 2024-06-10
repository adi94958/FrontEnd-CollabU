import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String id;

  Future<void> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var idGet = prefs.getString("id");

    setState(() {
      if (idGet == null) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushNamed(context, '/login');
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          // Navigate to the StartScreen
          Navigator.pushReplacementNamed(context, '/start');
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getId();
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
