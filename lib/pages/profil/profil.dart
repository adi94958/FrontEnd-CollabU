import 'package:collab_u/pages/profil/widget/jurusan.dart';
import 'package:collab_u/pages/profil/widget/keahlian.dart';
import 'package:collab_u/pages/profil/widget/pengalaman.dart';
import 'package:collab_u/pages/profil/widget/prestasi.dart';
import 'package:collab_u/pages/profil/widget/profil_atas.dart';
import 'package:collab_u/pages/profil/widget/ringkasan.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late Map<String, dynamic> profileData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/profil/1'));

    if (response.statusCode == 200) {
      setState(() {
        profileData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(249, 249, 249, 255),
        body: SingleChildScrollView(
          // ignore: unnecessary_null_comparison
          child: profileData == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const ProfilAtas(),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        children: [
                          RingkasanWidget(data: profileData),
                          const SizedBox(
                            height: 20,
                          ),
                          PengalamanWidget(
                              pengalamanData: (profileData['pengalaman'] != null
                                  ? (profileData['pengalaman'] as List)
                                      .cast<Map<String, dynamic>>()
                                  : [])),
                          const SizedBox(
                            height: 20,
                          ),
                          const JurusanWidget(),
                          const SizedBox(
                            height: 20,
                          ),
                          KeahlianWidget(
                              dataKeahlian: (profileData['keahlian'] != null
                                  ? (profileData['keahlian'] as List)
                                      .cast<Map<String, dynamic>>()
                                  : [])),
                          const SizedBox(
                            height: 20,
                          ),
                          PrestasiWidget(
                              prestasiData: (profileData['prestasi'] != null
                                  ? (profileData['prestasi'] as List)
                                      .cast<Map<String, dynamic>>()
                                  : [])),
                          const SizedBox(
                            height: 20,
                          ),
                          const ResumeWidget(),
                          const SizedBox(
                            height: 20,
                          ),
                          const LogoutWidget()
                        ],
                      ),
                    ),
                    const SizedBox(
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
