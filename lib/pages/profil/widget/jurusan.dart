import 'package:collab_u/model/user_pendidikan.dart';
import 'package:flutter/material.dart';

class JurusanWidget extends StatefulWidget {
  final UserPendidikan? dataPendidikan;
  const JurusanWidget({super.key, required this.dataPendidikan});

  @override
  _JurusanWidgetState createState() => _JurusanWidgetState();
}

class _JurusanWidgetState extends State<JurusanWidget> {
  late UserPendidikan? dataJurusan;

  @override
  void initState() {
    super.initState();
    dataJurusan = widget.dataPendidikan;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dataJurusan != null ? 169 : 70,
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
                  onPressed: () {
                    dataJurusan != null
                        ? Navigator.pushNamed(
                            context, '/profil/edit_pengalaman')
                        : Navigator.pushNamed(
                            context, '/profil/tambah_pengalaman');
                  },
                  icon: dataJurusan != null
                      ? const Icon(Icons.border_color_outlined)
                      : const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          // Check if dataJurusan is not empty, if not, display Divider and Container
          if (dataJurusan != null)
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
                  height: dataJurusan != null ? 164 - 85 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataJurusan!.jurusan!.namaJurusan!,
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
                        dataJurusan!.prodi!.namaProdi!,
                        style: const TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Angkatan ${dataJurusan!.tahunMasuk}',
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
