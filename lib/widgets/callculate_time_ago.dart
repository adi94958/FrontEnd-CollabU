import 'package:flutter/material.dart';

class TimeAgoText extends StatelessWidget {
  final String? dateString; // Mengubah menjadi nullable

  const TimeAgoText(this.dateString, {Key? key}) : super(key: key);

  String calculateTimeAgo(String? dateString) {
    if (dateString == null)
      return 'Tanggal tidak tersedia'; // Menangani null case
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
    return Text(
      calculateTimeAgo(dateString),
      style: const TextStyle(
        color: Color(0xFF94929B),
        fontSize: 10,
        fontFamily: 'Poppins',
      ),
    );
  }
}
