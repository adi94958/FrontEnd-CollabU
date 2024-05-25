import 'package:collab_u/model/user_pengalaman.dart';
import 'package:flutter/material.dart';

class PengalamanWidget extends StatefulWidget {
  final List<UserPengalaman> pengalamanData;

  const PengalamanWidget({
    Key? key,
    required this.pengalamanData,
  }) : super(key: key);

  @override
  State<PengalamanWidget> createState() => _PengalamanWidgetState();
}

class _PengalamanWidgetState extends State<PengalamanWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.pengalamanData.isNotEmpty
          ? widget.pengalamanData.length > 3
              ? 70 * 3 + 100
              : 70 * widget.pengalamanData.length.toDouble() + 100
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
          // Check if pengalamanData is not empty, if not, display Divider and Container
          if (widget.pengalamanData.isNotEmpty)
            Column(
              children: [
                SizedBox(
                  height: widget.pengalamanData.isNotEmpty
                      ? widget.pengalamanData.length > 3
                          ? 70 * 3
                          : 70 * widget.pengalamanData.length.toDouble()
                      : 0,
                  width: 335,
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                          List.generate(widget.pengalamanData.length, (index) {
                        final perusahaan = widget.pengalamanData[index];
                        final tahunBerakhir = perusahaan.tglSelesai;
                        final String tahun = ' - $tahunBerakhir';
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              const Divider(
                                thickness: 0,
                                height: 1,
                                indent: 15,
                                endIndent: 25,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                title: Text(
                                  perusahaan.perusahaan,
                                  style: const TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '${perusahaan.posisi}\n${perusahaan.tglMulai}$tahun',
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
                            ],
                          ),
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
