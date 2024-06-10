import 'dart:io';

import 'package:collab_u/bloc/ProfileCubit/profile_cubit.dart';
import 'package:collab_u/pages/profil/edit/profil_atas_edit.dart';
import 'package:collab_u/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

enum Gender { male, female }

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => EditProfilState();
}

class EditProfilState extends State<EditProfil> {
  final _formKey = GlobalKey<FormState>();

  Gender _selectedGender = Gender.male;
  final TextEditingController dateController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController shortNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  String jenisKelamin = '';
  DateTime tempDate = DateTime.now();
  DateFormat format = DateFormat("yyyy-MM-dd");
  int id = 0;

  // ignore: unused_field
  File? _image;

  // ignore: unused_field
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        initializeDateFormatting('id');
        dateController.text = DateFormat.yMMMMd('id').format(picked);
      });
    }
  }

  @override
  void initState() {
    initializeDateFormatting('id');
    _image = null;
    super.initState();
  }

  void _updateImage(File? image) {
    setState(() {
      _image = image;
    });
  }

  void editData() {
    if (_selectedGender == Gender.male) {
      jenisKelamin == "Pria";
    } else {
      jenisKelamin == "Wanita";
    }
    final Map<String, dynamic> profil = {
      'email': emailController.text,
      'nama_lengkap': fullNameController.text,
      'nama_panggilan': shortNameController.text,
      'tanggal_lahir': DateFormat('yyyy-MM-dd').format(_selectedDate!),
      'jenis_kelamin': jenisKelamin,
      'no_telp': noHpController.text,
    };
    print(profil);
    UserApi.editProfil(context, profil);
  }

  void editDataWithImage() {
    if (_selectedGender == Gender.male) {
      jenisKelamin = "Pria";
    } else {
      jenisKelamin = "Wanita";
    }
    final Map<String, dynamic> profil = {
      'email': emailController.text,
      'nama_lengkap': fullNameController.text,
      'nama_panggilan': shortNameController.text,
      'tanggal_lahir': DateFormat('yyyy-MM-dd').format(_selectedDate!),
      'jenis_kelamin': jenisKelamin,
      'no_telp': noHpController.text,
    };
    print(profil);
    UserApi.editProfilwithImage(context, profil, _image!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(249, 249, 249, 255),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileEdit) {
              if (_selectedDate == null) {
                fullNameController.text = state.user.namaLengkap!;
                shortNameController.text = state.user.namaPanggilan!;
                emailController.text = state.user.email!;
                noHpController.text = state.user.noTelp!;
                _selectedGender = state.user.jenisKelamin! == "Pria"
                    ? Gender.male
                    : Gender.female;
                jenisKelamin = state.user.jenisKelamin!;
                dateController.text = state.user.tanggalLahir!;
                tempDate = format.parse(dateController.text);
                _selectedDate = tempDate;
                dateController.text = DateFormat.yMMMMd('id').format(tempDate);
              }
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  EditTop(
                    onImageChanged: _updateImage,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nama Lengkap',
                              style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: fullNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Nama lengkap tidak boleh kosong';
                                  }
                                  if (value.length > 100) {
                                    return 'Nama lengkap maksimal 100 karakter';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10.0),
                                  hintText: 'Masukkan nama lengkap',
                                ),
                                style: const TextStyle(
                                    fontSize: 12, fontFamily: 'DMSans'),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Nama Panggilan',
                              style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: shortNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Nama panggilan tidak boleh kosong';
                                  }
                                  if (value.length > 50) {
                                    return 'Nama panggilan maksimal 50 karakter';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10.0),
                                  hintText: 'Masukkan nama panggilan',
                                ),
                                style: const TextStyle(
                                    fontSize: 12, fontFamily: 'DMSans'),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Tanggal Lahir',
                              style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: dateController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Tanggal lahir tidak boleh kosong';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    suffixIcon: const Icon(
                                      Icons.calendar_month_outlined,
                                      size: 19,
                                    )),
                                style: const TextStyle(
                                    fontSize: 12, fontFamily: 'DMSans'),
                                onTap: () {
                                  _selectDate(context);
                                },
                                readOnly: true,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Gender',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedGender = Gender.male;
                                    });
                                  },
                                  child: Container(
                                    width: 160,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Center text and radio button
                                      children: [
                                        Radio(
                                          value: Gender.male,
                                          groupValue: _selectedGender,
                                          onChanged: (Gender? value) {
                                            setState(() {
                                              _selectedGender = value!;
                                            });
                                          },
                                          activeColor: Colors
                                              .orange, // Change radio button color to orange
                                        ),
                                        const Text(
                                          'Laki - Laki',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'DMSans'),
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedGender = Gender.female;
                                    });
                                  },
                                  child: Container(
                                    width: 160,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Center text and radio button
                                      children: [
                                        Radio(
                                          value: Gender.female,
                                          groupValue: _selectedGender,
                                          onChanged: (Gender? value) {
                                            setState(() {
                                              _selectedGender = value!;
                                            });
                                          },
                                          activeColor: Colors
                                              .orange, // Change radio button color to orange
                                        ),
                                        const Text(
                                          'Perempuan',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'DMSans'),
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Email',
                              style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  }
                                  if (value.length > 100) {
                                    return 'Email maksimal 100 karakter';
                                  }
                                  if (!RegExp(
                                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                      .hasMatch(value)) {
                                    return 'Masukkan email yang valid';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10.0),
                                  hintText: 'Masukkan email',
                                ),
                                style: const TextStyle(
                                    fontSize: 12, fontFamily: 'DMSans'),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'No. Hp',
                              style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: noHpController,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'No. Hp tidak boleh kosong';
                                  }
                                  if (value.length > 13) {
                                    return 'No. Hp harus terdiri dari kurang 13 angka';
                                  }
                                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                    return 'No. Hp harus berupa angka';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  hintText: 'Masukkan no. Hp',
                                ),
                                style: const TextStyle(
                                    fontSize: 12, fontFamily: 'DMSans'),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (_image != null) {
                                      editDataWithImage();
                                    } else {
                                      editData();
                                    }
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.pushNamed(context, '/profil');
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color.fromARGB(200, 19, 1, 96)),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(double.infinity, 50),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'SIMPAN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
