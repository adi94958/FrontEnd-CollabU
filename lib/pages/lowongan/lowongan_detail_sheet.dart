// import 'package:flutter/material.dart';
// import '../../model/home/angkatan.dart';
// import '../../model/home/jurusan.dart';
// import '../../model/home/lowongan.dart';
// import '../../model/home/prodi.dart';
// import '../utils/calculate_ago.dart';

// class LowonganDetailSheet extends StatelessWidget {
//   final String posisi;
//   final String kompetisi;
//   final String tglPosting;
//   final String nama;
//   final String prodi_perekrut;
//   final String deskripsiKerja;
//   final String deskripsi;
//   final List<Jurusan> jurusanList;
//   final List<Prodi> prodiList;
//   final List<Angkatan> angkatanList;

//   const LowonganDetailSheet({
//     required this.posisi,
//     required this.kompetisi,
//     required this.tglPosting,
//     required this.nama,
//     required this.prodi_perekrut,
//     required this.deskripsiKerja,
//     required this.deskripsi,
//     required this.jurusanList,
//     required this.prodiList,
//     required this.angkatanList,
//   });

//   @override
//   Widget build(BuildContext context) {
//     TabController _tabController = DefaultTabController.of(context)!;

//     return Stack(
//       children: [
//         DraggableScrollableSheet(
//           initialChildSize: 0.75,
//           minChildSize: 0.6,
//           maxChildSize: 0.96,
//           builder: (_, controller) => Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(20),
//               ),
//             ),
//             padding:
//                 const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
//             child: ListView(
//               controller: controller,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 50,
//                     height: 5,
//                     margin: const EdgeInsets.only(bottom: 10),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFE8E8E8),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: SizedBox(
//                         height: 45,
//                         child: Image.asset('assets/images/profile.png'),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 4,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               nama,
//                               style: const TextStyle(
//                                 color: Color(0xFF150B3D),
//                                 fontSize: 14.0,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               prodi_perekrut,
//                               style: const TextStyle(
//                                 color: Color(0xFFAAA6B9),
//                                 fontSize: 12.0,
//                                 fontFamily: 'Poppins',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Text(
//                           posisi,
//                           style: const TextStyle(
//                             color: Color(0xFF2E3137),
//                             fontSize: 24,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           kompetisi,
//                           style: const TextStyle(
//                             color: Color(0xFF9EA1A5),
//                             fontSize: 12,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 20),
//                   height: 45,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF3F3F3),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: TabBar(
//                     controller: _tabController,
//                     indicator: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           spreadRadius: 1,
//                           blurRadius: 3,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     indicatorPadding: const EdgeInsets.all(5),
//                     labelColor: const Color(0xFF2E3137),
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     tabs: const [
//                       Tab(
//                         child: Text(
//                           'Deskripsi',
//                           style: TextStyle(
//                             color: Color(0xFF2E3137),
//                             fontSize: 14,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           'Kualifikasi',
//                           style: TextStyle(
//                             color: Color(0xFF2E3137),
//                             fontSize: 14,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           'Job Desk',
//                           style: TextStyle(
//                             color: Color(0xFF2E3137),
//                             fontSize: 14,
//                             fontFamily: 'Poppins',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 500,
//                   child: TabBarView(
//                     controller: _tabController,
//                     children: [
//                       SingleChildScrollView(
//                         padding: const EdgeInsets.all(10),
//                         child: Text(
//                           deskripsi,
//                           textAlign: TextAlign.justify,
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             Container(
//                               alignment: Alignment.topLeft,
//                               padding: const EdgeInsets.all(10),
//                               child: const Text(
//                                 'Jurusan',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Wrap(
//                                 children: jurusanList.map((jurusan) {
//                                   return itemDataKualifikasi(
//                                       jurusan.nama_jurusan);
//                                 }).toList(),
//                               ),
//                             ),
//                             Container(
//                               alignment: Alignment.topLeft,
//                               padding: const EdgeInsets.all(10),
//                               child: const Text(
//                                 'Program Studi',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Wrap(
//                                 children: prodiList.map((prodi) {
//                                   return itemDataKualifikasi(prodi.nama_prodi);
//                                 }).toList(),
//                               ),
//                             ),
//                             Container(
//                               alignment: Alignment.topLeft,
//                               padding: const EdgeInsets.all(10),
//                               child: const Text(
//                                 'Jenjang Pendidikan',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Wrap(
//                                 children: angkatanList.map((angkatan) {
//                                   return itemDataKualifikasi(angkatan.angkatan);
//                                 }).toList(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         padding: const EdgeInsets.all(10),
//                         child: Wrap(
//                           children: [
//                             Text(
//                               deskripsiKerja,
//                               textAlign: TextAlign.justify,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: Container(
//             height: 80,
//             color: Colors.white,
//             child: Container(
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFF9228),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: const Center(
//                 child: Text(
//                   'Lamar',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget itemDataKualifikasi(String data) {
//     return Container(
//       margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF3F3F3),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Text(
//         data,
//         style: const TextStyle(
//           fontSize: 14,
//         ),
//       ),
//       constraints: const BoxConstraints(
//         minWidth: 0,
//         maxWidth: double.infinity,
//       ),
//     );
//   }
// }
