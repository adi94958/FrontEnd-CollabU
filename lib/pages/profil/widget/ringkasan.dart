import 'package:collab_u/bloc/RingkasanCubit/ringkasan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: tentangSaya != null ? 169 : 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 70,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        context.read<RingkasanCubit>().resetRingkasan();
                        if (tentangSaya != null) {
                          context
                              .read<RingkasanCubit>()
                              .editRingkasan(tentangSaya);
                        }
                        Navigator.pushNamed(
                            context, '/profil/tambah_ringkasan');
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      color: Colors.white,
                      height: tentangSaya.isNotEmpty ? 164 - 85 : 0,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Wrap(
                        children: [
                          Text(
                            tentangSaya,
                            style: const TextStyle(fontFamily: 'DMSans'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
