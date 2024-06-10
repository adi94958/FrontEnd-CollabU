import 'package:collab_u/bloc/RingkasanCubit/ringkasan_cubit.dart';
import 'package:collab_u/pages/profil/widget/backtoprofile.dart';
import 'package:collab_u/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TambahRingkasan extends StatefulWidget {
  const TambahRingkasan({super.key});

  @override
  State<TambahRingkasan> createState() => TambahRingkasanState();
}

class TambahRingkasanState extends State<TambahRingkasan> {
  final _formKey = GlobalKey<FormState>();
  final ringkasanController = TextEditingController();
  var isFormActive = false;
  late int firstInitial;

  @override
  void initState() {
    firstInitial = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(249, 249, 249, 255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackToProfile(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<RingkasanCubit, RingkasanState>(
                  builder: (context, state) {
                    if (state is EditRingkasan) {
                      if (ringkasanController.text.isEmpty &&
                          firstInitial == 0) {
                        firstInitial = 1;
                        ringkasanController.text = state.ringkasan;
                      }
                    }
                    return Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            const Text(
                              'Ringkasan Pribadi',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Stack(
                              children: [
                                TextFormField(
                                  controller: ringkasanController,
                                  maxLength: 150,
                                  maxLines: 8,
                                  minLines: 6,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    hintText: 'Enter your text',
                                    counterText: '',
                                  ),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'DMSans',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Ringkasan tidak boleh kosong';
                                    }
                                    if (value.length > 150) {
                                      return 'Ringkasan tidak boleh lebih dari 150 karakter';
                                    }
                                    return null;
                                  },
                                  onChanged: (_) {
                                    setState(() {});
                                  },
                                ),
                                Positioned(
                                  bottom: !isFormActive ? 10 : 35,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '${ringkasanController.text.length}/150',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      UserApi.updateData(context, ringkasanController.text);
                      Navigator.pushNamed(context, '/profil');
                    } else {
                      setState(() {
                        isFormActive = true;
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(200, 19, 1, 96)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
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
            ),
          ],
        ),
      ),
    );
  }
}
