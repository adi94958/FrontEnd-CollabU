import 'package:collab_u/bloc/PrestasiCubit/prestasi_cubit.dart';
import 'package:collab_u/pages/profil/prestasi/widget/hapus_prestasi.dart';
import 'package:collab_u/pages/profil/widget/backtoprofile.dart';
import 'package:collab_u/services/profil_api/prestasi_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class EditPrestasi extends StatefulWidget {
  const EditPrestasi({super.key});

  @override
  State<EditPrestasi> createState() => _EditPrestasiState();
}

class _EditPrestasiState extends State<EditPrestasi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController date = TextEditingController();
  final TextEditingController penghargaanController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  DateTime tempDate = DateTime.now();
  DateFormat format = DateFormat("yyyy");
  String id = '';
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
  void initState() {
    initializeDateFormatting('id');
    super.initState();
  }

  void editData() {
    final Map<String, dynamic> prestasi = {
      'nama_penghargaan': penghargaanController.text,
      'kategori': kategoriController.text,
      'tahun': DateFormat('yyyy').format(_selectedYear!),
    };
    PrestasiApi.editPrestasi(context, prestasi, id);
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<PrestasiCubit, PrestasiState>(
            builder: (context, state) {
              if (state is PrestasiEdit) {
                if (_selectedYear == null) {
                  penghargaanController.text = state.penghargaan;
                  kategoriController.text = state.kategori;
                  date.text = state.tahun;
                  id = state.id;
                  tempDate = format.parse(date.text);
                  _selectedYear = tempDate;
                  date.text = DateFormat.y('id').format(tempDate);
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Ubah Prestasi',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Penghargaan',
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
                                      vertical: 5, horizontal: 10.0),
                                  hintText: 'Enter your text',
                                ),
                                style: const TextStyle(
                                    fontSize: 12, fontFamily: 'DMSans'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Penghargaan tidak boleh kosong';
                                  } else if (value.length > 70) {
                                    return 'Penghargaan tidak boleh lebih dari 50 huruf';
                                  }
                                  return null;
                                },
                                onChanged: (_) {
                                  setState(() {});
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Kategori',
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
                                      vertical: 5, horizontal: 10.0),
                                  hintText: 'Enter your text',
                                ),
                                style: const TextStyle(
                                    fontSize: 12, fontFamily: 'DMSans'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Kategori atau team tidak boleh kosong';
                                  } else if (value.length > 50) {
                                    return 'Kategori atau team tidak boleh lebih dari 50 huruf';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Tahun Kompetisi',
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
                                        vertical: 5.0, horizontal: 10.0),
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Tahun tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HapusPrestasi(id: id),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            editData();
                            Navigator.pushNamed(context, '/profil');
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
                              const Size(160, 50)),
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
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
