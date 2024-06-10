// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:collab_u/model/kompetisi/kompetisi.dart';
// import 'package:collab_u/services/url_global.dart';

// class InformasiKompetisi extends StatefulWidget {
  
//   const InformasiKompetisi({super.key});

//   @override
//   State<InformasiKompetisi> createState() => _InformasiKompetisiState();
// }

// class _InformasiKompetisiState extends State<InformasiKompetisi> {
//   List<Kompetisi> kompetisiList= [];

//   @override
//   void initState() {
//     super.initState();
//     fetchKompetisiList();
//   }

//   Future<void> fetchKompetisiList() async {
//     final response = await http.get(Uri.parse('$baseUrl/kompetisi'));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body) as List;
//       setState(() {
//         kompetisiList = jsonData.map((item) => Kompetisi.fromJson(item)).toList();
//       });
//     } else {
//       throw Exception('Failed to load kompetisi list');
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(249, 249, 249, 255),
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/navbar');
//             },
//             icon: const Icon(Icons.west_outlined),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 15),
//                 const Text(
//                   'Informasi Kompetisi',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildTextField(
//                         label: 'Kompetisi',
//                         controller: kompetisiController,
//                         hintText: 'Enter your text',
//                         height: 40,
//                       ),
//                       const SizedBox(height: 15),
//                       _buildTextField(
//                         label: 'Posisi',
//                         controller: posisiController,
//                         hintText: 'Enter your text',
//                         height: 40,
//                       ),
//                       const SizedBox(height: 15),
//                       _buildTextField(
//                         label: 'Penjelasan',
//                         controller: penjelasanController,
//                         hintText: 'Enter your text',
//                         maxLength: 200,
//                         maxLines: 8,
//                         minLines: 6,
//                       ),
//                       const SizedBox(height: 10),
//                       _buildTextField(
//                         label: 'Job Desk',
//                         controller: jobDeskController,
//                         hintText: 'Enter your text',
//                         maxLength: 200,
//                         maxLines: 8,
//                         minLines: 6,
//                       ),
//                       const SizedBox(height: 10),
//                       _buildDropdownField(
//                         label: 'Jurusan',
//                         items: jurusanList.map((e) => e.namaJurusan).toList(),
//                         value: null,
//                         onChanged: (String? newValue) {
//                           if (newValue != null) {
//                             final selectedJurusanItem = jurusanList.firstWhere((jurusan) => jurusan.namaJurusan == newValue);
//                             setState(() {
//                               selectedJurusan.add(selectedJurusanItem.idJurusan);
//                             });
//                           }
//                         },
//                         selectedList: selectedJurusan.map((id) {
//                           return jurusanList.firstWhere((jurusan) => jurusan.idJurusan == id).namaJurusan;
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 10),
//                       Wrap(
//                         spacing: 8.0,
//                         children: selectedJurusan.map((id) {
//                           final jurusanName = jurusanList.firstWhere((jurusan) => jurusan.idJurusan == id).namaJurusan;
//                           return Chip(
//                             label: Text(jurusanName),
//                             onDeleted: () {
//                               setState(() {
//                                 selectedJurusan.remove(id);
//                               });
//                             },
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 10),
//                       _buildDropdownField(
//                         label: 'Program Studi',
//                         items: prodiList.map((e) => e.namaProdi).toList(),
//                         value: null,
//                         onChanged: (String? newValue) {
//                           if (newValue != null) {
//                             final selectedProdiItem = prodiList.firstWhere((prodi) => prodi.namaProdi == newValue);
//                             setState(() {
//                               selectedProdi.add(selectedProdiItem.idProdi);
//                             });
//                           }
//                         },
//                         selectedList: selectedProdi.map((id) {
//                           return prodiList.firstWhere((prodi) => prodi.idProdi == id).namaProdi;
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 10),
//                       Wrap(
//                         spacing: 8.0,
//                         children: selectedProdi.map((id) {
//                           final prodiName = prodiList.firstWhere((prodi) => prodi.idProdi == id).namaProdi;
//                           return Chip(
//                             label: Text(prodiName),
//                             onDeleted: () {
//                               setState(() {
//                                 selectedProdi.remove(id);
//                               });
//                             },
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 10),
//                       _buildDropdownField(
//                         label: 'Tingkat',
//                         items: tingkatList,
//                         value: null,
//                         onChanged: (String? newValue) {
//                           if (newValue != null &&
//                               !selectedTingkat.contains(newValue)) {
//                             setState(() {
//                               selectedTingkat.add(newValue);
//                             });
//                           }
//                         },
//                         selectedList: selectedTingkat,
//                       ),
//                       const SizedBox(height: 10),
//                       Wrap(
//                         spacing: 8.0,
//                         children: selectedTingkat.map((tingkat) {
//                           return Chip(
//                             label: Text(tingkat),
//                             onDeleted: () {
//                               setState(() {
//                                 selectedTingkat.remove(tingkat);
//                               });
//                             },
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 10),
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: submitForm,
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                               const Color.fromARGB(200, 19, 1, 96),
//                             ),
//                             shape: MaterialStateProperty.all<OutlinedBorder>(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             minimumSize: MaterialStateProperty.all<Size>(
//                               const Size(213, 50),
//                             ),
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text(
//                               'SIMPAN',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String label,
//     required TextEditingController controller,
//     required String hintText,
//     double? height,
//     int? maxLength,
//     int? maxLines,
//     int? minLines,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontFamily: 'DMSans',
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 10),
//         SizedBox(
//           height: height ?? 100,
//           width: double.infinity,
//           child: TextFormField(
//             controller: controller,
//             maxLength: maxLength,
//             maxLines: maxLines,
//             minLines: minLines,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               contentPadding:
//                   const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
//               hintText: hintText,
//               counterText: '',
//             ),
//             style: const TextStyle(
//               fontSize: 12,
//               fontFamily: 'DMSans',
//             ),
//             onChanged: (_) {
//               setState(() {});
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDropdownField({
//     required String label,
//     required List<String> items,
//     required String? value,
//     required void Function(String?) onChanged,
//     required List<String> selectedList,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontFamily: 'DMSans',
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 10),
//         DropdownButtonFormField<String>(
//           value: value,
//           items: items.map((String item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               child: Text(item),
//             );
//           }).toList(),
//           onChanged: onChanged,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
//           ),
//           validator: (value) {
//             if (selectedList.isEmpty) {
//               return 'Please select at least one item';
//             }
//             return null;
//           },
//         ),
//       ],
//     );
//   }
// }
