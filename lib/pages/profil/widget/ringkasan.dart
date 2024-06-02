import 'package:flutter/material.dart';

class RingkasanWidget extends StatefulWidget {
  final String? tentangSaya;

  const RingkasanWidget({
    Key? key,
    required this.tentangSaya,
  }) : super(key: key);

  @override
  _RingkasanWidgetState createState() => _RingkasanWidgetState();
}

class _RingkasanWidgetState extends State<RingkasanWidget> {
  @override
  Widget build(BuildContext context) {
    String? tentangSaya = widget.tentangSaya;
    return Container(
      height: tentangSaya != null ? 169 : 70,
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 93,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profil/tambah_ringkasan');
                  },
                  icon: tentangSaya != null
                      ? const Icon(Icons.border_color_outlined)
                      : const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          // Check if tentangSaya is not empty, if not, display Divider and Container
          if (tentangSaya != null)
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
