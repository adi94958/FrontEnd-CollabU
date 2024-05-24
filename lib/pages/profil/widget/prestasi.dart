import 'package:collab_u/model/user_prestasi.dart';
import 'package:flutter/material.dart';

class PrestasiWidget extends StatefulWidget {
  final List<UserPrestasi> prestasiData;

  const PrestasiWidget({
    Key? key,
    required this.prestasiData,
  }) : super(key: key);

  @override
  State<PrestasiWidget> createState() => _PrestasiWidgetState();
}

class _PrestasiWidgetState extends State<PrestasiWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.prestasiData.isNotEmpty
          ? widget.prestasiData.length > 3
              ? 70 * 3 + 100
              : 70 * widget.prestasiData.length.toDouble() + 100
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
          // Check if prestasiData is not empty, if not, display Divider and Container
          if (widget.prestasiData.isNotEmpty)
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
                  height: widget.prestasiData.isNotEmpty
                      ? widget.prestasiData.length > 3
                          ? 70 * 3
                          : 70 * widget.prestasiData.length.toDouble()
                      : 0,
                  width: 320,
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                          List.generate(widget.prestasiData.length, (index) {
                        final kompetisi = widget.prestasiData[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                kompetisi.namaPenghargaan,
                                style: const TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '${kompetisi.kategori}\n${kompetisi.tahun}',
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
