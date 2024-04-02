import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BoxContainer extends StatelessWidget {
  final IconData icon;
  final String text;

  BoxContainer({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10), // Add SizedBox here
        Container(
          height: 70,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20), // Circular border
          ),
          child: Row(
            children: [
              SizedBox(width: 15), // Space from the left
              Icon(
                icon,
                size: 40,
                color: icon == LineAwesomeIcons.alternate_sign_out
                    ? Colors.red
                    : Colors.orange,
              ),
              SizedBox(width: 10), // Space between icon and text
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Add onPressed action here
                },
                icon: Icon(LineAwesomeIcons.plus_circle),
                iconSize: 35,
                color: Colors.orange,
              ),
              SizedBox(width: 10), // Space from the right
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
