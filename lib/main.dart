import 'package:collab_u/bloc/ProfileBloc/profile_bloc.dart';
import 'package:collab_u/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProfileBloc>(
        create: (BuildContext context) => ProfileBloc(),
      ),
      // Add more BlocProviders here if you have multiple Blocs
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.getSplashScreen(),
      getPages: AppPage.routes,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(
            fontSize: 14, // Adjust the font size as needed
            fontFamily: 'DMSans', // Ensure it matches your desired font
          ),
        ),
      ),
    ),
  ));
}
