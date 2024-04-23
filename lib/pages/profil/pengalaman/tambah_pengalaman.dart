import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';

class TambahPengalaman extends StatefulWidget {
  const TambahPengalaman({super.key});

  @override
  State<TambahPengalaman> createState() => _TambahPengalamanState();
}

class _TambahPengalamanState extends State<TambahPengalaman> {
  final _formKey = GlobalKey<FormState>();
  final dateMasukController = TextEditingController();
  final dateBerakhirController = TextEditingController();
  final posisiController = TextEditingController();
  final perusahaanController = TextEditingController();

  // ignore: unused_field
  DateTime? _selectedDateMasuk;
  // ignore: unused_field
  DateTime? _selectedDateBerakhir;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (controller == dateMasukController) {
          _selectedDateMasuk = picked;
        } else {
          _selectedDateBerakhir = picked;
        }
        initializeDateFormatting('id');
        controller.text = DateFormat.yMMMM('id').format(picked);
      });
    }
  }

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
                            const SizedBox(
                              height: 40,
                            ),
                            const Text(
                              'Hapus Perubahan ?',
                              style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Yakin menghapus perubahan yang telah anda masukkan?',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {},
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
                                  const Size(213, 50),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'BATAL',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/profil');
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromRGBO(244, 67, 54, 1)),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
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
                  });
            },
            icon: const Icon(Icons.west_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Tambahkan Pengalaman',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 580,
                width: 400,
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Posisi',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFormField(
                            controller: posisiController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors
                                  .white, // Set your desired background color
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20.0),
                              hintText: 'Enter your text',
                            ),
                            style: const TextStyle(
                                fontSize: 12, fontFamily: 'DMSans'),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Perusahaan atau Team',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFormField(
                            controller: perusahaanController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors
                                  .white, // Set your desired background color
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20.0),
                              hintText: 'Enter your text',
                            ),
                            style: const TextStyle(
                                fontSize: 12, fontFamily: 'DMSans'),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Tanggal Masuk',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFormField(
                            controller: dateMasukController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors
                                    .white, // Set your desired background color
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 20.0),
                                hintText: 'Enter your text',
                                prefixIcon: const Icon(
                                  Icons.calendar_month_outlined,
                                  size: 19,
                                )),
                            style: const TextStyle(
                                fontSize: 12, fontFamily: 'DMSans'),
                            onTap: () {
                              _selectDate(context, dateMasukController);
                            },
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Tanggal Berakhir',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFormField(
                            controller: dateBerakhirController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors
                                    .white, // Set your desired background color
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 20.0),
                                hintText: 'Enter your text',
                                prefixIcon: const Icon(
                                  Icons.calendar_month_outlined,
                                  size: 19,
                                )),
                            style: const TextStyle(
                                fontSize: 12, fontFamily: 'DMSans'),
                            onTap: () {
                              _selectDate(context, dateBerakhirController);
                            },
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamed(context, '/profil');
                                // Form is validated, submit your data
                                // You can access form values like:
                                // fullNameController.text
                                // shortNameController.text
                                // dateMasukController.text
                                // dateBerakhirController.text
                                // email.text
                                // noHp.text
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
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
