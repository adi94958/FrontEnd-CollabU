import 'package:flutter/material.dart';

class ItemDataKualifikasi extends StatelessWidget {
  final String data;

  const ItemDataKualifikasi(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      constraints: const BoxConstraints(
        minWidth: 0,
        maxWidth: double.infinity,
      ),
    );
  }
}
