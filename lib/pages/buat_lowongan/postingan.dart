import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collab_u/model/lowongan/deskripsi.dart';

class Postingan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Deskripsi deskripsi = Get.arguments as Deskripsi;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Deskripsi Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kompetisi: ${deskripsi.kompetisi ?? ""}'),
            const SizedBox(height: 10),
            Text('Posisi: ${deskripsi.posisi ?? ""}'),
            const SizedBox(height: 10),
            Text('Penjelasan: ${deskripsi.penjelasan ?? ""}'),
            const SizedBox(height: 10),
            Text('Job Desk: ${deskripsi.jobDesk ?? ""}'),
            const SizedBox(height: 10),
            Text('Jurusan: ${deskripsi.jurusan?.join(', ') ?? ""}'),
          ],
        ),
      ),
    );
  }
}
