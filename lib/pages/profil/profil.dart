import 'package:collab_u/bloc/JurusanProdiBloc/jurusan_prodi_list_bloc.dart';
import 'package:collab_u/bloc/ProfileBloc/profile_bloc.dart';
import 'package:collab_u/model/user_profile.dart';
import 'package:collab_u/pages/profil/widget/jurusan.dart';
import 'package:collab_u/pages/profil/widget/keahlian.dart';
import 'package:collab_u/pages/profil/widget/pengalaman.dart';
import 'package:collab_u/pages/profil/widget/prestasi.dart';
import 'package:collab_u/pages/profil/widget/profil_atas.dart';
import 'package:collab_u/pages/profil/widget/ringkasan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  void initState() {
    context.read<JurusanProdiListBloc>().add(GetJurusan());
    context.read<ProfileBloc>().add(GetProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(249, 249, 249, 255),
        body: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          child:
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              final userProfile = state.userProfile;
              return ProfileWidget(userProfile: userProfile);
            } else {
              return const Center(child: Text('Failed to load profile'));
            }
          }),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.userProfile,
  });

  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 175,
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    RingkasanWidget(
                      tentangSaya: userProfile.tentangSaya,
                    ),
                    const SizedBox(height: 20),
                    PengalamanWidget(
                      pengalamanData: userProfile.pengalaman,
                    ),
                    const SizedBox(height: 20),
                    JurusanWidget(
                      dataPendidikan: userProfile.pendidikan,
                    ),
                    const SizedBox(height: 20),
                    KeahlianWidget(
                      dataKeahlian: userProfile.keahlian,
                    ),
                    const SizedBox(height: 20),
                    PrestasiWidget(
                      prestasiData: userProfile.prestasi,
                    ),
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
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ProfilAtas(
            user: userProfile.pengguna,
            pendidikan: userProfile.pendidikan,
          ),
        ),
      ],
    );
  }
}

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("id");
    Future.delayed(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Berhasil Logout'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () {
          logout(context);
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 70,
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
              ),
            ],
          ),
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 70,
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
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline),
                      color: Colors.orange,
                      iconSize: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
