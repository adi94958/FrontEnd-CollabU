import 'package:flutter/material.dart';

class ProfileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 45,
            child: Image.asset('assets/images/profile.png'),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Adinda Raisa Az-zahra.',
                  style: TextStyle(
                    color: Color(0xFF150B3D),
                    fontSize: 14.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'D3 Teknik Informatika',
                  style: TextStyle(
                    color: Color(0xFFAAA6B9),
                    fontSize: 12.0,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: Image.asset('assets/images/arrow-right.png'),
          ),
        ),
      ],
    );
  }
}
