import 'package:collab_u/bloc/ProfileCubit/profile_cubit.dart';
import 'package:collab_u/model/user.dart';
import 'package:collab_u/model/user_pendidikan.dart';
import 'package:collab_u/model/user_prodi.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late dynamic fotoProfil;
  late String id;
  @override
  void initState() {
    user = widget.user;
    prodi = widget.pendidikan?.prodi;
    fotoProfil = widget.user?.fotoProfil;
    id = widget.user!.idPengguna.toString();
    super.initState();
  }

  void editProfile(BuildContext context, User user, String prodi) {
    context.read<ProfileCubit>().resetProfile();
    context.read<ProfileCubit>().editProfile(user, prodi);
    Navigator.pushNamed(context, '/profil/edit');
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
      Positioned(
          top: 60,
          left: 20,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: fotoProfil == null
                ? const AssetImage('assets/images/profile.png')
                : NetworkImage('$baseUrl/foto-profil/$id') as ImageProvider,
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
            editProfile(context, user!, prodi!.namaProdi!);
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
