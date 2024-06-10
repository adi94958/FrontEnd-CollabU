import 'package:collab_u/bloc/JurusanCubit/jurusan_cubit_cubit.dart';
import 'package:collab_u/bloc/JurusanProdiBloc/jurusan_prodi_list_bloc.dart';
import 'package:collab_u/model/user_jurusan.dart';
import 'package:collab_u/model/user_prodi.dart';
import 'package:collab_u/pages/profil/widget/backtoprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class EditJurusan extends StatefulWidget {
  const EditJurusan({super.key});

  @override
  State<EditJurusan> createState() => _EditJurusanState();
}

class _EditJurusanState extends State<EditJurusan> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController date = TextEditingController();
  DateTime tempDate = DateTime.now();
  DateFormat format = DateFormat("yyyy");
  int id = 0;
  List<UserJurusan> jurusan = [];
  List<UserProdi> prodi = [];
  String? selectedJurusan;
  String? selectedProdi;
  List<UserProdi> filteredProdi = [];
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
        child: BlocBuilder<JurusanCubitCubit, JurusanCubitState>(
          builder: (context, state) {
            if (state is JurusanCubitEdit) {
              selectedJurusan = state.jurusan;
              selectedProdi = state.prodi;
              date.text = state.tahun;
              tempDate = format.parse(date.text);
              _selectedYear = tempDate;
              date.text = DateFormat.y('id').format(tempDate);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Ubah Jurusan',
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
                    child: BlocBuilder<JurusanProdiListBloc,
                        JurusanProdiListState>(
                      builder: (context, state) {
                        if (state is JurusanProdiListLoaded) {
                          jurusan = state.jurusan;
                          prodi = state.prodi;
                          if (selectedJurusan != null) {
                            filteredProdi = prodi
                                .where((p) =>
                                    p.idJurusan ==
                                    jurusan
                                        .firstWhere(
                                            (j) =>
                                                j.namaJurusan ==
                                                selectedJurusan,
                                            orElse: () => UserJurusan(
                                                idJurusan: 0,
                                                idPt: 0,
                                                namaJurusan: ""))
                                        .idJurusan)
                                .toList();
                          }
                        }
                        return Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Jurusan',
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedJurusan,
                                  items: jurusan.map((UserJurusan jurusan) {
                                    return DropdownMenuItem<String>(
                                      value: jurusan.idJurusan.toString(),
                                      child: Text(jurusan.namaJurusan!),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedJurusan = value;
                                      filteredProdi = prodi
                                          .where((p) =>
                                              p.idJurusan ==
                                              jurusan
                                                  .firstWhere(
                                                      (j) =>
                                                          j.namaJurusan ==
                                                          selectedJurusan,
                                                      orElse: () => UserJurusan(
                                                          idJurusan: 0,
                                                          idPt: 0,
                                                          namaJurusan: ""))
                                                  .idJurusan)
                                          .toList();
                                      selectedProdi = null;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20.0),
                                    hintText: 'Pilih Jurusan',
                                  ),
                                  style: const TextStyle(
                                      fontSize: 12, fontFamily: 'DMSans'),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Program Studi',
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedProdi,
                                  items: filteredProdi.map((UserProdi prodi) {
                                    return DropdownMenuItem<String>(
                                      value: prodi.idProdi.toString(),
                                      child: Text(prodi.namaProdi!),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedProdi = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20.0),
                                    hintText: 'Pilih Program Studi',
                                  ),
                                  style: const TextStyle(
                                      fontSize: 12, fontFamily: 'DMSans'),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Tahun Masuk',
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
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 10.0),
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
                              ],
                            ));
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const HapusJurusan(),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(jurusan);
                          // Navigator.pushNamed(context, '/profil');
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
                          const Size(160, 50),
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
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      ),
    ));
  }
}

class HapusJurusan extends StatelessWidget {
  const HapusJurusan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
                        'Hapus Jurusan ?',
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
            });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.red), // Ubah warna latar menjadi merah
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(160, 50),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'HAPUS', // Ubah teks menjadi "HAPUS"
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
