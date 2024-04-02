import 'package:flutter/material.dart';
import 'package:collab_u/component/profilBody.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final double coverHeight = 225;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    buildCoverImage(),
                    Positioned(
                      top: 10,
                      left: 5,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/navbar');
                        },
                        icon: Icon(LineAwesomeIcons.angle_left),
                        color: Colors.white,
                      ),
                    ),
                    Positioned(top: 80, left: 25, child: buildProfileImage()),
                    Positioned(top: 160, left: 25, child: buildNamaProfile()),
                    Positioned(
                      top: 160,
                      right: 15,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profil');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Mengatur round edge menjadi 10
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Spasi antara ikon dan teks
                              Text(
                                'Edit Profil',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.edit,
                                size: 20,
                              ), // Icon di sini
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoxContainer(
                          icon: LineAwesomeIcons.user_circle,
                          text: 'Ringkasan Pribadi'),
                      BoxContainer(
                          icon: LineAwesomeIcons.briefcase, text: 'Pengalaman'),
                      BoxContainer(
                          icon: LineAwesomeIcons.graduation_cap,
                          text: 'Pendidikan'),
                      BoxContainer(
                          icon: LineAwesomeIcons.atom, text: 'Keahlian'),
                      BoxContainer(
                          icon: LineAwesomeIcons.award, text: 'Prestasi'),
                      BoxContainer(
                          icon: LineAwesomeIcons.clipboard, text: 'Resume'),
                      BoxContainer(
                          icon: LineAwesomeIcons.alternate_sign_out,
                          text: 'Log Out')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCoverImage() => ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0)), // Adjust the radius as needed
        child: Container(
          color: Colors.grey,
          child: Image(
            image: AssetImage('assets/images/background.png'),
            width: double.infinity,
            height: coverHeight,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: 30.0,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage('assets/images/profile.png'),
      );

  Widget buildNamaProfile() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Muhammad Adi Saputra',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'D3 Teknik Informatika',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      );
}
