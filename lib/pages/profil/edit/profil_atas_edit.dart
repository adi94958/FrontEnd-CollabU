import 'dart:io';

import 'package:collab_u/bloc/ProfileCubit/profile_cubit.dart';
import 'package:collab_u/services/url_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditTop extends StatefulWidget {
  final void Function(File? image) onImageChanged;
  const EditTop({
    super.key,
    required this.onImageChanged,
  });

  @override
  State<EditTop> createState() => _EditTopState();
}

class _EditTopState extends State<EditTop> {
  // ignore: unused_field
  File? _image;
  bool changed = false;
  late dynamic fotoProfil;
  late String id;
  late String fullName;
  late String prodi;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        changed = true;
        widget.onImageChanged(_image);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileEdit) {
          fotoProfil = state.user.fotoProfil;
          id = state.user.idPengguna.toString();
          fullName = state.user.namaLengkap!;
          prodi = state.pendidikan!;
        }
        return Stack(children: [
          Container(
            height: 250,
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
                  Navigator.pushNamed(context, '/profil');
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
                    ? changed == true
                        ? FileImage(_image!) as ImageProvider
                        : const AssetImage('assets/images/profile.png')
                    : changed == true
                        ? FileImage(_image!) as ImageProvider
                        : NetworkImage('$baseUrl/foto-profil/$id'),
              )),
          Positioned(
            top: 130,
            left: 20,
            child: Text(
              fullName,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          Positioned(
            top: 150,
            left: 20,
            child: Text(
              prodi,
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
          Positioned(
            top: 180,
            left: 15,
            child: ElevatedButton(
              onPressed: () {
                getImage();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                shadowColor: MaterialStateProperty.all<Color>(
                    Colors.grey.withOpacity(0.5)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text('Change Image',
                  style: TextStyle(color: Colors.white)),
            ),
          )
        ]);
      },
    );
  }
}
