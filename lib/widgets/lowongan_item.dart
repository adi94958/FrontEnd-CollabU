import 'package:flutter/material.dart';
import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/widgets/callculate_time_ago.dart';

class LowonganItem extends StatelessWidget {
  final String posisi;
  final String kompetisi;
  final String tglPosting;
  final String status;
  final int idLowongan;

  const LowonganItem({
    required this.posisi,
    required this.kompetisi,
    required this.tglPosting,
    required this.status,
    required this.idLowongan,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/lamaran/manajemen_lamaran',
          arguments: {
            'idLowongan': idLowongan,
            'posisi': posisi,
            'kompetisi': kompetisi,
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 5, right: 15),
              child: Text(
                status.toLowerCase() == 'buka' ? 'Buka' : 'Tutup',
                style: TextStyle(
                  color: status.toLowerCase() == 'buka'
                      ? Colors.green
                      : Colors.red,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20),
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
                        TimeAgoText(tglPosting),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset('assets/images/arrow-right.png'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
