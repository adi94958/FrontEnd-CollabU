import 'package:collab_u/pages/splashScreen.dart';
import 'package:collab_u/pages/startScreen.dart';
import 'package:get/get.dart';
import 'package:collab_u/navbar/navbar.dart';
import 'package:collab_u/pages/home.dart';
import 'package:collab_u/pages/activity.dart';
import 'package:collab_u/pages/chat.dart';
import 'package:collab_u/pages/lamaran.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: start, page: () => const StartScreen()),
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: activity, page: () => const Activity()),
    GetPage(name: chat, page: () => const Chat()),
    GetPage(name: lamaran, page: () => const Lamaran()),
  ];

  static getSplashScreen() => splash;
  static getStartScreen() => start;
  static getNavbar() => navbar;
  static getHome() => home;
  static getActivity() => activity;
  static getChat() => chat;
  static getLamaran() => lamaran;

  static String splash = '/';
  static String start = '/start';
  static String navbar = '/navbar';
  static String home = '/home';
  static String activity = '/activity';
  static String chat = '/chat';
  static String lamaran = '/lamaran';
}
