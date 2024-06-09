import 'package:collab_u/model/user.dart';
import 'package:collab_u/model/user_pendidikan.dart';
import 'package:collab_u/model/user_prodi.dart';
import 'package:flutter/material.dart';

class ProfilAtas extends StatefulWidget {
  final User? user;
  final UserPendidikan? pendidikan;
  const ProfilAtas({super.key, required this.user, this.pendidikan});

  @override
  State<ProfilAtas> createState() => _ProfilAtasState();
}

class _ProfilAtasState extends State<ProfilAtas> {
  late User? user;
  late UserProdi? prodi;
  @override
  void initState() {
    user = widget.user;
    prodi = widget.pendidikan?.prodi;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18))),
      ),
      Positioned(
          top: 2,
          left: 0,
          child: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/navbar');
            },
            icon: const Icon(
              Icons.west,
              color: Colors.white,
            ),
            iconSize: 27,
          )),
      const Positioned(
          top: 60,
          left: 20,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/profile.png'),
          )),
      Positioned(
        top: 130,
        left: 20,
        child: Text(
          user!.namaLengkap.toString(),
          style:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      Positioned(
        top: 150,
        left: 20,
        child: Text(
          prodi?.namaProdi ?? '',
          style:
              const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      Positioned(
        top: 140,
        right: 10,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/profil/edit');
          },
          icon: const Icon(Icons.edit, color: Colors.white),
          label:
              const Text('Edit Profile', style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            shadowColor:
                MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.5)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      )
    ]);
  }
}
