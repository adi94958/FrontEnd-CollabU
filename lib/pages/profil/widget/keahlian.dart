import 'package:collab_u/model/user_keahlian.dart';
import 'package:flutter/material.dart';

class KeahlianWidget extends StatefulWidget {
  final List<UserKeahlian> dataKeahlian;

  const KeahlianWidget({
    Key? key,
    required this.dataKeahlian,
  }) : super(key: key);

  @override
  State<KeahlianWidget> createState() => _KeahlianWidgetState();
}

class _KeahlianWidgetState extends State<KeahlianWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.dataKeahlian.isNotEmpty ? 200 : 70,
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
                  icon: widget.dataKeahlian.isNotEmpty
                      ? const Icon(Icons.border_color_outlined)
                      : const Icon(Icons.add_circle_outline),
                  color: Colors.orange,
                  iconSize: 24,
                ),
              ],
            ),
          ),
          // Check if ringkasan is not empty, if not, display Divider and Container
          if (widget.dataKeahlian.isNotEmpty)
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
                  height: widget.dataKeahlian.isNotEmpty ? 164 - 60 : 0,
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: widget.dataKeahlian.map((skill) {
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[200], // Change the color as needed
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            skill.keahlian,
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
