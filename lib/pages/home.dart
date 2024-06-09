import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/services/lowongan_services.dart';
import 'package:flutter/material.dart';
import 'package:collab_u/widgets/job_item.dart';
import 'package:collab_u/widgets/profile_home.dart';
import 'package:collab_u/widgets/job_item_placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  int? idPengguna;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadIdPengguna();
  }

  Future<void> _loadIdPengguna() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idPengguna = int.tryParse(prefs.getString("id") ?? '');
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F5F5),
        title: Row(
          children: [
            Expanded(
              flex: 5,
              child: RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Collab',
                      style: TextStyle(
                        color: Color(0xFF120A8F),
                      ),
                    ),
                    TextSpan(
                      text: 'U',
                      style: TextStyle(
                        color: Color(0xFFF1801B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/notifikasi');
              },
              child: const Icon(
                Icons.notifications,
                size: 30,
                color: Color(0xFF524B6B),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profil');
                  },
                  child: ProfileHome(),
                ),
                Image.asset('assets/images/banner.png'),
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Daftar Lowongan',
                          style: TextStyle(
                            color: Color(0xFF150B3D),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/daftar_lowongan');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Lihat Semua',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFAAA6B9),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FutureBuilder<List<Lowongan>>(
                  future: LowonganService.fetchLowongans(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        children:
                            List.generate(4, (index) => JobItemPlaceholder()),
                      );
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Center(child: Text('Failed to load data'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('Tidak ada lowongan'));
                    } else {
                      // Filter the list to only include open positions and not owned by idPengguna
                      List<Lowongan> openPositions = snapshot.data!
                          .where((lowongan) => lowongan.status == 'buka')
                          .where(
                              (lowongan) => lowongan.idPengguna != idPengguna)
                          .toList();

                      if (openPositions.isEmpty) {
                        return Center(
                            child: Text('No open positions available'));
                      } else {
                        // Limit to only the first 4 items
                        openPositions = openPositions.take(4).toList();
                        return Column(
                          children: openPositions.map((lowongan) {
                            return JobItem(
                              lowongan: lowongan,
                              tabController: _tabController,
                            );
                          }).toList(),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
