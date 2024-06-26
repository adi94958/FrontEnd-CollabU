import 'package:collab_u/bloc/PrestasiCubit/prestasi_cubit.dart';
import 'package:collab_u/model/user_prestasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrestasiWidget extends StatefulWidget {
  final List<UserPrestasi>? prestasiData;

  const PrestasiWidget({
    Key? key,
    required this.prestasiData,
  }) : super(key: key);

  @override
  State<PrestasiWidget> createState() => _PrestasiWidgetState();
}

class _PrestasiWidgetState extends State<PrestasiWidget> {
  late List<UserPrestasi>? prestasi;
  @override
  void initState() {
    prestasi = widget.prestasiData;
    super.initState();
  }

  void editPrestasi(BuildContext context, String id, String penghargaan,
      String kategori, String tahun) {
    context.read<PrestasiCubit>().resetPrestasi();
    context
        .read<PrestasiCubit>()
        .editPrestasi(id, penghargaan, kategori, tahun);
    Navigator.pushNamed(context, '/profil/edit_prestasi');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: prestasi!.isNotEmpty
            ? prestasi!.length > 3
                ? 70 * 3 + 100
                : 70 * prestasi!.length.toDouble() + 100
            : 70,
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
                    const Spacer(),
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
            ),
            // Check if prestasiData is not empty, if not, display Divider and Container
            if (prestasi!.isNotEmpty)
              Column(
                children: [
                  SizedBox(
                    height: prestasi!.isNotEmpty
                        ? prestasi!.length > 3
                            ? 70 * 3
                            : 80 * prestasi!.length.toDouble()
                        : 0,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(prestasi!.length, (index) {
                          final kompetisi = prestasi![index];
                          final String? penghargaan = kompetisi.namaPenghargaan;
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
                                    penghargaan!,
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
                                      editPrestasi(
                                          context,
                                          kompetisi.id.toString(),
                                          penghargaan,
                                          kompetisi.kategori!,
                                          kompetisi.tahun.toString());
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
      ),
    );
  }
}
