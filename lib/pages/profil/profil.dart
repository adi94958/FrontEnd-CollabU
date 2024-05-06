import 'package:collab_u/pages/profil/widget/jurusan.dart';
import 'package:collab_u/pages/profil/widget/keahlian.dart';
import 'package:collab_u/pages/profil/widget/pengalaman.dart';
import 'package:collab_u/pages/profil/widget/prestasi.dart';
import 'package:collab_u/pages/profil/widget/profil_atas.dart';
import 'package:collab_u/pages/profil/widget/ringkasan.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(249, 249, 249, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfilAtas(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    RingkasanWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    PengalamanWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    JurusanWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    KeahlianWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    JurusanWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    PrestasiWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    ResumeWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    LogoutWidget()
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 335,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 290,
            decoration: const BoxDecoration(color: Colors.white),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  size: 24,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 335,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 295,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.assignment_ind_outlined,
                  size: 24,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Resume',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 160,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
