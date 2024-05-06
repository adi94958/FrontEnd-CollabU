import 'package:flutter/material.dart';

List<Map<String, dynamic>> dataPerusahaan = [
  {
    'namaPerusahaan': 'Perusahaan A',
    'posisi': 'Software Engineer',
    'tahunMasuk': 2018,
    'tahunBerakhir': 2020,
  },
  {
    'namaPerusahaan': 'Perusahaan B',
    'posisi': 'Data Scientist',
    'tahunMasuk': 2019,
    'tahunBerakhir': 2021,
  },
  {
    'namaPerusahaan': 'Perusahaan C',
    'posisi': 'Product Manager',
    'tahunMasuk': 2020,
    'tahunBerakhir': null,
  },
  {
    'namaPerusahaan': 'Perusahaan D',
    'posisi': 'Data Scientist',
    'tahunMasuk': 2019,
    'tahunBerakhir': 2021,
  },
  {
    'namaPerusahaan': 'Perusahaan A',
    'posisi': 'Software Engineer',
    'tahunMasuk': 2018,
    'tahunBerakhir': 2020,
  },
  {
    'namaPerusahaan': 'Perusahaan B',
    'posisi': 'Data Scientist',
    'tahunMasuk': 2019,
    'tahunBerakhir': 2021,
  },
  {
    'namaPerusahaan': 'Perusahaan C',
    'posisi': 'Product Manager',
    'tahunMasuk': 2020,
    'tahunBerakhir': null,
  },
  {
    'namaPerusahaan': 'Perusahaan D',
    'posisi': 'Data Scientist',
    'tahunMasuk': 2019,
    'tahunBerakhir': 2021,
  },
];

class PengalamanWidget extends StatelessWidget {
  const PengalamanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dataPerusahaan.isNotEmpty
          ? dataPerusahaan.length > 3
              ? 70 * 3 + 100
              : 70 * dataPerusahaan.length.toDouble() + 100
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
                  'Pengalaman',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 130,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profil/tambah_pengalaman');
                  },
                  icon: const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          // Check if dataPerusahaan is not empty, if not, display Divider and Container
          if (dataPerusahaan.isNotEmpty)
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
                  height: dataPerusahaan.isNotEmpty
                      ? dataPerusahaan.length > 3
                          ? 70 * 3
                          : 70 * dataPerusahaan.length.toDouble()
                      : 0,
                  width: 320,
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(dataPerusahaan.length, (index) {
                        final perusahaan = dataPerusahaan[index];
                        final tahunBerakhir = perusahaan['tahunBerakhir'];
                        final String tahun = tahunBerakhir != null
                            ? ' - $tahunBerakhir'
                            : ' - Sekarang';
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                perusahaan['namaPerusahaan'],
                                style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '${perusahaan['posisi']}\n${perusahaan['tahunMasuk']}$tahun',
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
                                      context, '/profil/edit_pengalaman');
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
