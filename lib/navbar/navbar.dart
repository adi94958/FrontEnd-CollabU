import 'package:collab_u/pages/buat_lowongan/tambah_deskripsi.dart';
import 'package:collab_u/pages/postingan.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:collab_u/controller/controller.dart';
import 'package:collab_u/pages/home.dart';
import 'package:collab_u/pages/chat.dart';
import 'package:collab_u/pages/activity.dart';
import 'package:collab_u/pages/lamaran.dart';
import 'package:iconly/iconly.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            Home(),
            Lamaran(),
            TambahDeskripsi(),
            Chat(),
            Activity(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color(0xFFFF9228),
            unselectedItemColor: Color(0xFFA49EB5),
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            items: [
              _BottombarItem(IconlyBold.home, "Home"),
              _BottombarItem(IconlyBold.work, "Lamaran"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle,
                    size: 40,
                    color: Color(0xFF130160),
                  ),
                  label: ""),
              _BottombarItem(IconlyBold.chat, "Chat"),
              _BottombarItem(IconlyBold.activity, "Activity"),
            ]),
      );
    });
  }
}

_BottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
