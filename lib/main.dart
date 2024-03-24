// import 'package:collab_u/screen/home_screen.dart';
// import 'package:collab_u/screen/splash_screen.dart';
// import 'package:collab_u/screen/start_screen.dart';
import 'package:collab_u/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getSplashScreen(),
    getPages: AppPage.routes,
  ));
}
