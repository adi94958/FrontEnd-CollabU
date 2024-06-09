import 'package:flutter/material.dart';
import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/widgets/job_item_placeholder.dart';
import 'package:collab_u/services/lamaran_services.dart';
import 'package:collab_u/widgets/lowongan_item.dart';

class Lamaran extends StatefulWidget {
  const Lamaran({Key? key}) : super(key: key);

  @override
  State<Lamaran> createState() => _LamaranState();
}

class _LamaranState extends State<Lamaran> {
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
                  future: LamaranService.fetchLamaran(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        children: List.generate(
                          snapshot.data?.length ?? 7,
                          (index) => JobItemPlaceholder(),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Center(child: Text('Failed to load data'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                          child: Text('Tidak ada lowongan yang kamu buat'));
                    } else {
                      return Column(
                        children: snapshot.data!.map((lowongan) {
                          return LowonganItem(
                            posisi: lowongan.posisi,
                            kompetisi: lowongan.kompetisi,
                            tglPosting: lowongan.tglPosting,
                            status: lowongan.status,
                            idLowongan: lowongan.idLowongan,
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
}
