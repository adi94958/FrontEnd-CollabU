import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/services/loading_shimer_lowongan.dart';
import 'package:collab_u/services/manajemen_lamaran_api.dart';
import 'package:flutter/material.dart';

class Lamaran extends StatefulWidget {
  const Lamaran({super.key});

  @override
  State<Lamaran> createState() => _LamaranState();
}

class _LamaranState extends State<Lamaran> {
  String calculateTimeAgo(String dateString) {
    final DateTime date = DateTime.parse(dateString);
    final Duration difference = DateTime.now().difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} Hari yang lalu';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} Jam yang lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} Menit yang lalu';
    } else {
      return 'Baru saja';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F5F5),
        toolbarHeight: 90,
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'Collab',
                            style: TextStyle(
                              color: Color(0xFF120A8F),
                            ),
                          ),
                          TextSpan(
                            text: 'U',
                            style: TextStyle(
                              color: Color(0xFFF1801B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Manajemen Lowongan Saya',
                    style: TextStyle(
                      color: Color(0xFF150B3D),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFF6F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FutureBuilder<List<Lowongan>>(
                  future: ManajemenLowonganService.fetchManajemenLowongans(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        children: List.generate(
                          snapshot.data?.length ?? 7,
                          (index) => buildJobItemPlaceholderShimmer(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Center(child: Text('Failed to load data'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data available'));
                    } else {
                      return Column(
                        children: snapshot.data!.map((lowongan) {
                          return daftarLowonganSaya(
                            context,
                            lowongan.posisi,
                            lowongan.kompetisi,
                            lowongan.tglPosting,
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget daftarLowonganSaya(
    BuildContext context,
    String posisi,
    String kompetisi,
    String tglPosting,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/lamaran/manajemen_lamaran/');
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      posisi,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF150A33),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      kompetisi,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF524B6B),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      calculateTimeAgo(tglPosting),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF94929B),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                height: 60,
                // color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset('assets/images/arrow-right.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
