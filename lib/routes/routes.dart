import 'package:collab_u/pages/daftar_lowongan.dart';
import 'package:collab_u/pages/notifikasi.dart';
import 'package:collab_u/pages/postingan.dart';
import 'package:collab_u/pages/splashScreen.dart';
import 'package:collab_u/pages/startScreen.dart';
import 'package:get/get.dart';
import 'package:collab_u/navbar/navbar.dart';
import 'package:collab_u/pages/home.dart';
import 'package:collab_u/pages/activity.dart';
import 'package:collab_u/pages/chat.dart';
import 'package:collab_u/pages/lamaran.dart';
import 'package:collab_u/pages/profil.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: start, page: () => const StartScreen()),
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: activity, page: () => const Activity()),
    GetPage(name: lamaran, page: () => const Postingan()),
    GetPage(name: chat, page: () => const Chat()),
    GetPage(name: lamaran, page: () => const Lamaran()),
    GetPage(name: daftar_lowongan, page: () => const DaftarLowongan()),
    GetPage(name: profil, page: () => const Profil()),
    GetPage(name: notifikasi, page: () => const Notifikasi()),
  ];

  static getSplashScreen() => splash;
  static getStartScreen() => start;
  static getNavbar() => navbar;
  static getHome() => home;
  static getActivity() => activity;
  static getPostingan() => postingan;
  static getChat() => chat;
  static getLamaran() => lamaran;
  static getDaftarLowongan() => daftar_lowongan;
  static getProfil() => profil;
  static getNotifikasi() => notifikasi;

  static String splash = '/';
  static String start = '/start';
  static String navbar = '/navbar';
  static String home = '/home';
  static String activity = '/activity';
  static String postingan = '/postingan';
  static String chat = '/chat';
  static String lamaran = '/lamaran';
  static String daftar_lowongan = '/daftar_lowongan';
  static String profil = '/profil';
  static String notifikasi = '/notifikasi';
}
