import 'package:collab_u/bloc/JurusanCubit/jurusan_cubit_cubit.dart';
import 'package:collab_u/bloc/JurusanProdiBloc/jurusan_prodi_list_bloc.dart';
import 'package:collab_u/bloc/PengalamanCubit/pengalaman_cubit.dart';
import 'package:collab_u/bloc/PrestasiCubit/prestasi_cubit.dart';
import 'package:collab_u/bloc/ProfileBloc/profile_bloc.dart';
import 'package:collab_u/bloc/ProfileCubit/profile_cubit.dart';
import 'package:collab_u/bloc/RingkasanCubit/ringkasan_cubit.dart';
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
      BlocProvider<PengalamanCubit>(
          create: (BuildContext context) => PengalamanCubit()),
      BlocProvider<RingkasanCubit>(
          create: (BuildContext context) => RingkasanCubit()),
      BlocProvider<PrestasiCubit>(
          create: (BuildContext context) => PrestasiCubit()),
      BlocProvider<ProfileCubit>(
          create: (BuildContext context) => ProfileCubit()),
      BlocProvider<JurusanCubitCubit>(
          create: (BuildContext context) => JurusanCubitCubit()),
      BlocProvider<JurusanProdiListBloc>(
          create: (BuildContext context) => JurusanProdiListBloc())
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.getSplashScreen(),
      getPages: AppPage.routes,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          errorStyle: TextStyle(
            fontSize: 12, // Adjust the font size as needed
            fontFamily: 'DMSans', // Ensure it matches your desired font
          ),
        ),
      ),
    ),
  ));
}
