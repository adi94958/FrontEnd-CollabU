import 'package:collab_u/pages/auth/login.dart';
import 'package:collab_u/pages/auth/register.dart';
import 'package:collab_u/pages/buat_lowongan/tambah_deskripsi.dart';
import 'package:collab_u/pages/daftar_lowongan.dart';
import 'package:collab_u/pages/notifikasi.dart';
import 'package:collab_u/pages/buat_lowongan/succes_page.dart';
import 'package:collab_u/pages/profil/edit/edit_profil_page.dart';
import 'package:collab_u/pages/profil/jurusan/edit_jurusan.dart';
import 'package:collab_u/pages/profil/jurusan/tambah_jurusan.dart';
import 'package:collab_u/pages/profil/pengalaman/edit_pengalaman.dart';
import 'package:collab_u/pages/profil/pengalaman/tambah_pengalaman.dart';
import 'package:collab_u/pages/profil/prestasi/edit_prestasi.dart';
import 'package:collab_u/pages/profil/prestasi/tambah_prestasi.dart';
import 'package:collab_u/pages/profil/ringkasan/tambah_ringkasan.dart';
import 'package:collab_u/pages/splashScreen.dart';
import 'package:collab_u/pages/startScreen.dart';
import 'package:get/get.dart';
import 'package:collab_u/navbar/navbar.dart';
import 'package:collab_u/pages/home.dart';
import 'package:collab_u/pages/activity.dart';
import 'package:collab_u/pages/chat.dart';
import 'package:collab_u/pages/lamaran.dart';
import 'package:collab_u/pages/profil/profil.dart';
import 'package:collab_u/pages/manajemen_lamaran.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: register, page: () => const Register()),
    GetPage(name: start, page: () => const StartScreen()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: activity, page: () => const Activity()),
    GetPage(name: sukses, page: () => SuccessPage()),
    GetPage(name: tambah_deskripsi, page: () => TambahDeskripsi()),
    GetPage(name: chat, page: () => const Chat()),
    GetPage(name: lamaran, page: () => const Lamaran()),
    GetPage(name: daftar_lowongan, page: () => const DaftarLowongan()),
    GetPage(name: profil, page: () => const ProfilPage()),
    GetPage(name: edit_profil, page: () => const EditProfil()),
    GetPage(name: notifikasi, page: () => const Notifikasi()),
    GetPage(name: manajemen_lamaran, page: () => ManajemenLamaran()),
    GetPage(name: profil_ringkasan, page: () => const TambahRingkasan()),
    GetPage(name: tambah_prestasi, page: () => const TambahPrestasi()),
    GetPage(name: edit_prestasi, page: () => const EditPrestasi()),
    GetPage(name: tambah_pengalaman, page: () => const TambahPengalaman()),
    GetPage(name: edit_pengalaman, page: () => const EditPengalaman()),
    GetPage(name: tambah_jurusan, page: () => const TambahJurusan()),
    GetPage(name: edit_jurusan, page: () => const EditJurusan()),
  ];

  static getSplashScreen() => splash;
  static getStartScreen() => start;
  static getLogin() => login;
  static getRegister() => register;
  static getNavbar() => navbar;
  static getHome() => home;
  static getActivity() => activity;
  static getSuccesPage() => sukses;
  static getChat() => chat;
  static getLamaran() => lamaran;
  static getDaftarLowongan() => daftar_lowongan;
  static getProfil() => profil;
  static getEditProfil() => edit_profil;
  static getNotifikasi() => notifikasi;
  static getManajemenLamaran() => manajemen_lamaran;
  static getRingkasan() => profil_ringkasan;
  static getTambahPrestasi() => tambah_prestasi;
  static getTambahPengalaman() => tambah_pengalaman;
  static getTambahJurusan() => tambah_jurusan;
  static getEditPrestasi() => edit_prestasi;
  static getEditPengalaman() => edit_pengalaman;
  static getEditJurusan() => edit_jurusan;
  static getTambahDeskripsi() => tambah_deskripsi;

  static String splash = '/';
  static String start = '/start';
  static String login = '/login';
  static String register = '/register';
  static String navbar = '/navbar';
  static String home = '/home';
  static String activity = '/activity';
  static String sukses = '/sukses';
  static String chat = '/chat';
  static String lamaran = '/lamaran';
  static String daftar_lowongan = '/daftar_lowongan';
  static String profil = '/profil';
  static String edit_profil = '/profil/edit';
  static String notifikasi = '/notifikasi';
  static String manajemen_lamaran = '/lamaran/manajemen_lamaran';
  static String profil_ringkasan = '/profil/tambah_ringkasan';
  static String tambah_prestasi = '/profil/tambah_prestasi';
  static String tambah_pengalaman = '/profil/tambah_pengalaman';
  static String tambah_jurusan = '/profil/tambah_jurusan';
  static String edit_prestasi = '/profil/edit_prestasi';
  static String edit_pengalaman = '/profil/edit_pengalaman';
  static String edit_jurusan = '/profil/edit_jurusan';
  static String tambah_deskripsi = '/tambah_deskripsi';
}
