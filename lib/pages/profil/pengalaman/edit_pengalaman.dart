import 'package:collab_u/bloc/PengalamanCubit/pengalaman_cubit.dart';
import 'package:collab_u/pages/profil/pengalaman/widget/hapus_pengalaman.dart';
import 'package:collab_u/pages/profil/widget/backtoprofile.dart';
import 'package:collab_u/services/component/constant.dart';
import 'package:collab_u/services/profil_api/pengalaman_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';

class EditPengalaman extends StatefulWidget {
  const EditPengalaman({super.key});

  @override
  State<EditPengalaman> createState() => _EditPengalamanState();
}

class _EditPengalamanState extends State<EditPengalaman> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dateMasukController = TextEditingController();
  final TextEditingController dateBerakhirController = TextEditingController();
  final TextEditingController posisiController = TextEditingController();
  final TextEditingController perusahaanController = TextEditingController();
  DateTime tempDate = DateTime.now();
  DateFormat format = DateFormat("yyyy-MM");
  int id = 0;

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
          if (_selectedDateBerakhir != null &&
              picked.isAfter(_selectedDateBerakhir!)) {
            ScaffoldMessenger.of(context).showSnackBar(snackBarTanggalMasuk);
            return;
          }
          _selectedDateMasuk = picked;
        } else {
          if (_selectedDateMasuk != null &&
              picked.isBefore(_selectedDateMasuk!)) {
            ScaffoldMessenger.of(context).showSnackBar(snackBarTanggalBerakhir);
            return;
          }
          _selectedDateBerakhir = picked;
        }
        initializeDateFormatting('id');
        controller.text = DateFormat.yMMMM('id').format(picked);
      });
    }
  }

  @override
  void initState() {
    initializeDateFormatting('id');
    super.initState();
  }

  void editData() {
    final Map<String, dynamic> pengalaman = {
      'posisi': posisiController.text,
      'perusahaan': perusahaanController.text,
      'tgl_mulai': DateFormat('yyyy-MM').format(_selectedDateMasuk!),
      'tgl_selesai': DateFormat('yyyy-MM').format(_selectedDateBerakhir!),
    };
    PengalamanApi.editPengalaman(context, pengalaman, id);
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
          child: BlocBuilder<PengalamanCubit, PengalamanState>(
            builder: (context, state) {
              if (state is PengalamanEdit) {
                if (_selectedDateMasuk == null &&
                    _selectedDateBerakhir == null) {
                  posisiController.text = state.posisi;
                  perusahaanController.text = state.perusahaan;
                  dateMasukController.text = state.tglMulai;
                  id = state.id;
                  tempDate = format.parse(dateMasukController.text);
                  _selectedDateMasuk = tempDate;
                  dateMasukController.text =
                      DateFormat.yMMMM('id').format(tempDate);
                  dateBerakhirController.text = state.tglSelesai;
                  tempDate = format.parse(dateBerakhirController.text);
                  _selectedDateBerakhir = tempDate;
                  dateBerakhirController.text =
                      DateFormat.yMMMM('id').format(tempDate);
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Ubah Pengalaman',
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
                                      vertical: 5, horizontal: 10.0),
                                  hintText: 'Enter your text',
                                ),
                                style: const TextStyle(
                                    fontSize: 12, fontFamily: 'DMSans'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Posisi tidak boleh kosong';
                                  } else if (value.length > 30) {
                                    return 'Posisi tidak boleh lebih dari 30 huruf';
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
                                      vertical: 5, horizontal: 10.0),
                                  hintText: 'Enter your text',
                                ),
                                style: const TextStyle(
                                    fontSize: 12, fontFamily: 'DMSans'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Perusahaan atau team tidak boleh kosong';
                                  } else if (value.length > 50) {
                                    return 'Perusahaan atau team tidak boleh lebih dari 50 huruf';
                                  }
                                  return null;
                                },
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
                                        vertical: 5.0, horizontal: 10.0),
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Tanggal masuk tidak boleh kosong';
                                  }
                                  return null;
                                },
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
                                        vertical: 5.0, horizontal: 10.0),
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Tanggal keluar tidak boleh kosong';
                                  }
                                  return null;
                                },
                                readOnly: true,
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
                      HapusPengalaman(id: id),
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
