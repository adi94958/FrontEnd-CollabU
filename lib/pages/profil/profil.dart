import 'package:collab_u/model/user_profile.dart';
import 'package:collab_u/pages/profil/widget/jurusan.dart';
import 'package:collab_u/pages/profil/widget/keahlian.dart';
import 'package:collab_u/pages/profil/widget/pengalaman.dart';
import 'package:collab_u/pages/profil/widget/prestasi.dart';
import 'package:collab_u/pages/profil/widget/profil_atas.dart';
import 'package:collab_u/pages/profil/widget/ringkasan.dart';
import 'package:collab_u/services/user_api.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  List<UserProfile> users = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(249, 249, 249, 255),
        body: Stack(
          children: [
            if (users.isEmpty)
              const Center(child: CircularProgressIndicator())
            else
              SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top +
                        175), // Tambahkan margin top
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          RingkasanWidget(tentangSaya: users[0].tentangSaya),
                          const SizedBox(height: 20),
                          PengalamanWidget(pengalamanData: users[0].pengalaman),
                          const SizedBox(height: 20),
                          const JurusanWidget(),
                          const SizedBox(height: 20),
                          KeahlianWidget(dataKeahlian: users[0].keahlian),
                          const SizedBox(height: 20),
                          PrestasiWidget(prestasiData: users[0].prestasi),
                          const SizedBox(height: 20),
                          const ResumeWidget(),
                          const SizedBox(height: 20),
                          const LogoutWidget(),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child:
                  ProfilAtas(), // Widget ProfilAtas akan tetap berada di atas
            ),
          ],
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
