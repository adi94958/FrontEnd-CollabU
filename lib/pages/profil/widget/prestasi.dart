import 'package:flutter/material.dart';

List<Map<String, dynamic>> dataPrestasi = [
  {
    'penghargaan': 'Juara 1 PKM',
    'kompetisi': 'Pekan Kreatifitas Mahasiswa',
    'tahunKompetisi': 2022,
  },
  {
    'penghargaan': 'Juara Harapan 1 Lomba Karya Tulis Ilmiah',
    'kompetisi': 'Olimpiade Sains Nasional',
    'tahunKompetisi': 2021,
  },
  {
    'penghargaan': 'Pemenang Kompetisi Inovasi Teknologi',
    'kompetisi': 'Hackathon Nasional',
    'tahunKompetisi': 2020,
  },
  {
    'penghargaan': 'Juara 3 Kompetisi Debat Bahasa Inggris',
    'kompetisi': 'Debat Bahasa Inggris Universitas',
    'tahunKompetisi': 2019,
  },
  {
    'penghargaan': 'Pemenang Kompetisi Penulisan Puisi',
    'kompetisi': 'Festival Sastra Mahasiswa',
    'tahunKompetisi': 2018,
  },
];

class PrestasiWidget extends StatelessWidget {
  const PrestasiWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dataPrestasi.isNotEmpty
          ? dataPrestasi.length > 3
              ? 70 * 3 + 100
              : 70 * dataPrestasi.length.toDouble() + 100
          : 70,
      width: 335,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 295,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.business_center_sharp,
                  size: 24,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Prestasi',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 158,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profil/tambah_prestasi');
                  },
                  icon: const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          // Check if dataPerusahaan is not empty, if not, display Divider and Container
          if (dataPrestasi.isNotEmpty)
            Column(
              children: [
                const Divider(
                  thickness: 0,
                  height: 1,
                  indent: 25,
                  endIndent: 25,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: dataPrestasi.isNotEmpty
                      ? dataPrestasi.length > 3
                          ? 70 * 3
                          : 70 * dataPrestasi.length.toDouble()
                      : 0,
                  width: 320,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(dataPrestasi.length, (index) {
                        final kompetisi = dataPrestasi[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                kompetisi['penghargaan'],
                                style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '${kompetisi['kompetisi']}\n${kompetisi['tahunKompetisi']}',
                                style: const TextStyle(
                                    fontFamily: 'DMSans', fontSize: 12),
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.border_color_outlined,
                                  color: Colors.orange,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/profil/edit_prestasi');
                                },
                              ),
                            ),
                            Divider(
                              thickness: 1.5,
                              color: Colors.grey[300],
                              indent: 16,
                              endIndent: 16,
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
