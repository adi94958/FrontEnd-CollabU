import 'package:flutter/material.dart';
import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/services/lowongan_services.dart';
import 'package:collab_u/widgets/job_item.dart';
import 'package:collab_u/widgets/job_item_placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DaftarLowongan extends StatefulWidget {
  const DaftarLowongan({super.key});

  @override
  State<DaftarLowongan> createState() => _DaftarLowonganState();
}

class _DaftarLowonganState extends State<DaftarLowongan>
    with TickerProviderStateMixin {
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
        toolbarHeight: 90,
        title: _buildTitle(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder<List<Lowongan>>(
              future: LowonganService.fetchLowongans(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: List.generate(8, (index) => JobItemPlaceholder()),
                  );
                } else if (snapshot.hasError) {
                  print('Error: ${snapshot.error}');
                  return Center(child: Text('Failed to load data'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Tidak ada lowongan'));
                } else {
                  List<Lowongan> openPositions = snapshot.data!
                      .where((lowongan) => lowongan.status == 'buka')
                      .where((lowongan) => lowongan.idPengguna != idPengguna)
                      .toList();
                  if (openPositions.isEmpty) {
                    return Center(child: Text('No open positions available'));
                  } else {
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
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: RichText(
                textAlign: TextAlign.right,
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
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            'Daftar Lowongan',
            style: TextStyle(
              color: Color(0xFF150B3D),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
