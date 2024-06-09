import 'package:flutter/material.dart';
import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/widgets/item_data_kualifikasi.dart';
import 'package:collab_u/services/lamar_lowongan_services.dart';

class JobDetailsSheet extends StatefulWidget {
  final Lowongan lowongan;
  final TabController tabController;

  const JobDetailsSheet({
    Key? key,
    required this.lowongan,
    required this.tabController,
  }) : super(key: key);

  @override
  _JobDetailsSheetState createState() => _JobDetailsSheetState();
}

class _JobDetailsSheetState extends State<JobDetailsSheet> {
  bool isProfileComplete = false;
  bool hasApplied = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DraggableScrollableSheet(
          initialChildSize: 0.75,
          minChildSize: 0.6,
          maxChildSize: 0.96,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            child: ListView(
              controller: controller,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8E8E8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Row(
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
                              widget.lowongan.nama,
                              style: const TextStyle(
                                color: Color(0xFF150B3D),
                                fontSize: 14.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.lowongan.prodi_perekrut,
                              style: const TextStyle(
                                color: Color(0xFFAAA6B9),
                                fontSize: 12.0,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.lowongan.posisi,
                          style: const TextStyle(
                            color: Color(0xFF2E3137),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.lowongan.kompetisi,
                          style: const TextStyle(
                            color: Color(0xFF9EA1A5),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: widget.tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    indicatorPadding: const EdgeInsets.all(5),
                    labelColor: const Color(0xFF2E3137),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(
                        child: Text(
                          'Deskripsi',
                          style: TextStyle(
                            color: Color(0xFF2E3137),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Kualifikasi',
                          style: TextStyle(
                            color: Color(0xFF2E3137),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Job Desk',
                          style: TextStyle(
                            color: Color(0xFF2E3137),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    controller: widget.tabController,
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.lowongan.deskripsi,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Jurusan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children:
                                    widget.lowongan.jurusan.map((jurusan) {
                                  return ItemDataKualifikasi(
                                      jurusan.nama_jurusan);
                                }).toList(),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Program Studi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: widget.lowongan.prodi.map((prodi) {
                                  return ItemDataKualifikasi(prodi.nama_prodi);
                                }).toList(),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Jenjang Pendidikan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children:
                                    widget.lowongan.angkatan.map((angkatan) {
                                  return ItemDataKualifikasi(angkatan.angkatan);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          children: [
                            Text(
                              widget.lowongan.deskripsiKerja,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              _checkProfileAndApply();
            },
            child: Container(
              height: 80,
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9228),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Lamar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _checkProfileAndApply() async {
    try {
      // Cek apakah profil lengkap
      bool isProfileComplete = await LamarLowonganService.checkProfile();

      // Cek apakah user sudah melamar
      bool hasApplied =
          await LamarLowonganService.checkPelamar(widget.lowongan.idLowongan);

      if (isProfileComplete && !hasApplied) {
        // Profil lengkap, lanjutkan dengan melamar
        await LamarLowonganService.applyJob(widget.lowongan.idLowongan);

        // Tampilkan pesan berhasil atau navigasi ke layar sukses
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil melamar pekerjaan!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      } else {
        if (hasApplied) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Peringatan!'),
              content: const Text('Pengguna sudah mendaftar sebelumnya.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Peringatan!'),
              content: const Text(
                  'Pengguna harus melengkapi profilnya terlebih dahulu.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      // Tangani error
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal melamar pekerjaan.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
