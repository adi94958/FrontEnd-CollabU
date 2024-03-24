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

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const SplashScreen(),
//         '/start': (context) => const StartScreen(),
//         '/home': (context) => const HomeScreen(),
//       },
//     );
//   }
// }
