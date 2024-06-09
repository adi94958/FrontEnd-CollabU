import 'package:flutter/material.dart';

class TambahJurusanLowongan extends StatefulWidget {
  const TambahJurusanLowongan({super.key});

  @override
  State<TambahJurusanLowongan> createState() => _TambahJurusanLowonganState();
}

class _TambahJurusanLowonganState extends State<TambahJurusanLowongan> {
  final _formKey = GlobalKey<FormState>();
  final List<String> selectedJurusans = [];
  final List<String> jurusanList = [
    'Teknik Informatika',
    'Sistem Informasi',
    'Manajemen',
    'Akuntansi',
    // Add more options as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(249, 249, 249, 255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/tambah_deskripsi');
            },
            icon: const Icon(Icons.west_outlined),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Tambahkan Jurusan',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDropdownField(
                        label: 'Jurusan',
                        items: jurusanList,
                        value: null,
                        onChanged: (String? newValue) {
                          if (newValue != null &&
                              !selectedJurusans.contains(newValue)) {
                            setState(() {
                              selectedJurusans.add(newValue);
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8.0,
                        children: selectedJurusans.map((jurusan) {
                          return Chip(
                            label: Text(jurusan),
                            onDeleted: () {
                              setState(() {
                                selectedJurusans.remove(jurusan);
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/tambah_prodi');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(200, 19, 1, 96),
                            ),
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
                              'SELANJUTNYA',
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required List<String> items,
    required String? value,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'DMSans',
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
          ),
          validator: (value) {
            if (selectedJurusans.isEmpty) {
              return 'Please select at least one jurusan';
            }
            return null;
          },
        ),
      ],
    );
  }
}
