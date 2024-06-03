import 'package:flutter/material.dart';

class TambahDeskripsi extends StatefulWidget {
  const TambahDeskripsi({super.key});

  @override
  State<TambahDeskripsi> createState() => _TambahDeskripsiState();
}

class _TambahDeskripsiState extends State<TambahDeskripsi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController jobDeskController = TextEditingController();
  final TextEditingController penjelasanController = TextEditingController();
  final TextEditingController posisiController = TextEditingController();
  final TextEditingController kompetisiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(249, 249, 249, 255),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/navbar');
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
                  'Tambahkan Deskripsi',
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
                      _buildTextField(
                        label: 'Kompetisi',
                        controller: kompetisiController,
                        hintText: 'Enter your text',
                        height: 40,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        label: 'Posisi',
                        controller: posisiController,
                        hintText: 'Enter your text',
                        height: 40,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        label: 'Penjelasan',
                        controller: penjelasanController,
                        hintText: 'Enter your text',
                        maxLength: 200,
                        maxLines: 8,
                        minLines: 6,
                      ),
                      const SizedBox(height: 10), // Reduced height from 15 to 10
                      _buildTextField(
                        label: 'Job Desk',
                        controller: jobDeskController,
                        hintText: 'Enter your text',
                        maxLength: 200,
                        maxLines: 8,
                        minLines: 6,
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacementNamed(
                                  context, '/navbar');
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
                              'Selanjutnya',
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

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    double? height,
    int? maxLength,
    int? maxLines,
    int? minLines,
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
        SizedBox(
          height: height ?? 100,
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            maxLength: maxLength,
            maxLines: maxLines,
            minLines: minLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              hintText: hintText,
              counterText: '',
            ),
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'DMSans',
            ),
            onChanged: (_) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
