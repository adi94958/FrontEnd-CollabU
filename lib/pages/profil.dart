import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// var ringkasan =
//     "Hope your day's going well! Just wanted to say hi and see how you're doing. Let's catch up soon. Take care and have a fantastic day!";

List<Map<String, String>> dataJurusan = [
  {
    'Jurusan': 'Teknik Komputer dan Informatika',
    'programStudi': 'D3 - Teknik Informatika',
    'tahunMasuk': '2022',
  }
];

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

List<String> skillsArray = [
  "JavaScript",
  "HTML",
  "CSS",
  "Python",
  "Java",
  "React",
  "Node.js",
  "SQL",
  "MongoDB",
  "Angular"
];

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(249, 249, 249, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfilAtas(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    RingkasanWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    PengalamanWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    JurusanWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    KeahlianWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    JurusanWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    PrestasiWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    ResumeWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    LogoutWidget()
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 335,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 290,
            decoration: const BoxDecoration(color: Colors.white),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  size: 24,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResumeWidget extends StatelessWidget {
  const ResumeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 335,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                  Icons.assignment_ind_outlined,
                  size: 24,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Resume',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 160,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                  onPressed: () {},
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
                          : 70 * dataPerusahaan.length.toDouble()
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
                                onPressed: () {},
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

class KeahlianWidget extends StatelessWidget {
  const KeahlianWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: skillsArray.isNotEmpty ? 200 : 70,
      width: 335,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                  Icons.diversity_2_outlined,
                  size: 24,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Keahlian',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 156,
                ),
                IconButton(
                  onPressed: () {},
                  icon: skillsArray.isNotEmpty
                      ? const Icon(Icons.border_color_outlined)
                      : const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          // Check if ringkasan is not empty, if not, display Divider and Container
          if (skillsArray.isNotEmpty)
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
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  width: 280,
                  height: skillsArray.isNotEmpty ? 164 - 60 : 0,
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: skillsArray.map((skill) {
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[200], // Change the color as needed
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            skill,
                            style: const TextStyle(fontFamily: 'DMSans'),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}

class JurusanWidget extends StatelessWidget {
  const JurusanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dataJurusan.isNotEmpty ? 169 : 70,
      width: 335,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                  Icons.school_outlined,
                  size: 24,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Jurusan',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 159,
                ),
                IconButton(
                  onPressed: () {},
                  icon: dataJurusan.isNotEmpty
                      ? const Icon(Icons.border_color_outlined)
                      : const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          // Check if dataJurusan is not empty, if not, display Divider and Container
          if (dataJurusan.isNotEmpty)
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
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  width: 280,
                  height: dataJurusan.isNotEmpty ? 164 - 85 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataJurusan[0]['Jurusan']!,
                        style: const TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        dataJurusan[0]['programStudi']!,
                        style: const TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Angkatan ${dataJurusan[0]['tahunMasuk']}',
                        style: const TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

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
                  onPressed: () {},
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
                                onPressed: () {},
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

class RingkasanWidget extends StatefulWidget {
  const RingkasanWidget({
    super.key,
  });

  @override
  _RingkasanWidgetState createState() => _RingkasanWidgetState();
}

class _RingkasanWidgetState extends State<RingkasanWidget> {
  String tentangSaya = '';

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/profil/1'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        tentangSaya = data['tentang_saya'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tentangSaya.isNotEmpty ? 169 : 70,
      width: 335,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                  Icons.account_circle_outlined,
                  size: 24,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Ringkasan Pribadi',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 93,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profil/tambah_ringkasan');
                  },
                  icon: tentangSaya.isNotEmpty
                      ? const Icon(Icons.border_color_outlined)
                      : const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          // Check if tentangSaya is not empty, if not, display Divider and Container
          if (tentangSaya.isNotEmpty)
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
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  width: 280,
                  height: tentangSaya.isNotEmpty ? 164 - 85 : 0,
                  child: Wrap(
                    children: [
                      Text(
                        tentangSaya,
                        style: const TextStyle(fontFamily: 'DMSans'),
                      )
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class ProfilAtas extends StatelessWidget {
  const ProfilAtas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18))),
      ),
      Positioned(
          top: 2,
          left: 0,
          child: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/navbar');
            },
            icon: const Icon(
              Icons.west,
              color: Colors.white,
            ),
            iconSize: 27,
          )),
      const Positioned(
          top: 60,
          left: 20,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/profile.png'),
          )),
      const Positioned(
        top: 130,
        left: 20,
        child: Text(
          'Muhammad Adi Saputera',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      const Positioned(
        top: 150,
        left: 20,
        child: Text(
          'D3 - Teknik Informatika',
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      Positioned(
        top: 140,
        right: 10,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.edit, color: Colors.white),
          label:
              const Text('Edit Profile', style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            shadowColor:
                MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.5)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      )
    ]);
  }
}
