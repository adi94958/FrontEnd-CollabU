import 'package:collab_u/services/user_api.dart';
import 'package:flutter/material.dart';

class TambahRingkasan extends StatefulWidget {
  const TambahRingkasan({super.key});

  @override
  State<TambahRingkasan> createState() => TambahRingkasanState();
}

class TambahRingkasanState extends State<TambahRingkasan> {
  final _formKey = GlobalKey<FormState>();
  final ringkasanController = TextEditingController();
  var isFormActive = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(249, 249, 249, 255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 260,
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          const Text(
                            'Hapus Perubahan?',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Yakin menghapus perubahan yang telah anda masukkan?',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(200, 19, 1, 96)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(213, 50),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'LANJUTKAN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/profil');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(244, 67, 54, 1)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(213, 50),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'HAPUS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.west_outlined),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
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
                      const Size(213, 50),
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
