import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
