import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TambahPrestasi extends StatefulWidget {
  const TambahPrestasi({super.key});

  @override
  State<TambahPrestasi> createState() => _TambahPrestasiState();
}

class _TambahPrestasiState extends State<TambahPrestasi> {
  final _formKey = GlobalKey<FormState>();
  final date = TextEditingController();
  final penghargaanController = TextEditingController();
  final kategoriController = TextEditingController();

  // ignore: unused_field
  DateTime? _selectedYear;

  Future<void> _selectYear(BuildContext context) async {
    final DateTime? picked = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 8),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
              selectedDate: _selectedYear ?? DateTime.now(),
              onChanged: (DateTime dateTime) {
                Navigator.of(context).pop(dateTime);
              },
            ),
          ),
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedYear = picked;
        initializeDateFormatting('id');
        date.text = DateFormat.y('id').format(picked);
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
                'Tambahkan Prestasi',
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
                          'Nama Penghargaan',
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
                            controller: penghargaanController,
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
                          'Kategori/Pencapaian yang Dicapai',
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
                            controller: kategoriController,
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
                          'Tahun',
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
                            controller: date,
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
                              _selectYear(context);
                            },
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(
                          height: 280,
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
                                // date.text
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
