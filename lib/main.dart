import 'package:collab_u/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getSplashScreen(),
    getPages: AppPage.routes,
    theme: ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(
          fontSize: 14,
          fontFamily: 'DMSans',
        ),
      ),
    ),
  ));
}
