import 'package:collab_u/bloc/PengalamanCubit/pengalaman_cubit.dart';
import 'package:collab_u/model/user_pengalaman.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart'; // Import intl package

class PengalamanWidget extends StatefulWidget {
  final List<UserPengalaman>? pengalamanData;

  const PengalamanWidget({
    Key? key,
    required this.pengalamanData,
  }) : super(key: key);

  @override
  State<PengalamanWidget> createState() => _PengalamanWidgetState();
}

class _PengalamanWidgetState extends State<PengalamanWidget> {
  late List<UserPengalaman>? pengalaman;
  DateFormat format = DateFormat("yyyy-MM");

  @override
  void initState() {
    initializeDateFormatting('id');
    pengalaman = widget.pengalamanData;
    super.initState();
  }

  // Fungsi untuk mengubah format tanggal
  String formatTanggal(String date) {
    final DateTime dateTime = format.parse(date);
    return DateFormat.yMMMM('id').format(dateTime);
  }

  void editPengalaman(
    BuildContext context,
    int id,
    String posisi,
    String perusahaan,
    String tglMulai,
    String tglSelesai,
  ) {
    context.read<PengalamanCubit>().clearPengalaman();
    context.read<PengalamanCubit>().editPengalaman(
          id,
          posisi,
          perusahaan,
          tglMulai,
          tglSelesai,
        );
    Navigator.pushNamed(context, '/profil/edit_pengalaman');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: pengalaman!.isNotEmpty
            ? pengalaman!.length > 3
                ? 70 * 3 + 100
                : 70 * pengalaman!.length.toDouble() + 100
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
                      'Pengalaman',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/profil/tambah_pengalaman');
                      },
                      icon: const Icon(Icons.add_circle_outline),
                      color: Colors.orange,
                      iconSize: 24,
                    ),
                  ],
                ),
              ),
            ),
            if (pengalaman!.isNotEmpty)
              Column(
                children: [
                  SizedBox(
                    height: pengalaman!.isNotEmpty
                        ? pengalaman!.length > 3
                            ? 70 * 3
                            : 80 * pengalaman!.length.toDouble()
                        : 0,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(pengalaman!.length, (index) {
                          final perusahaan = pengalaman![index];
                          final String? tanggalMulai = perusahaan.tglMulai;
                          final String tglMulaiFormatted =
                              formatTanggal(tanggalMulai!);
                          final String tglSelesaiFormatted =
                              perusahaan.tglSelesai != null
                                  ? formatTanggal(perusahaan.tglSelesai!)
                                  : 'Sekarang';
                          final String? namaPerusahaan = perusahaan.perusahaan;
                          final String periode =
                              '$tglMulaiFormatted - $tglSelesaiFormatted';

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
                                    namaPerusahaan!,
                                    style: const TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    '${perusahaan.posisi}\n$periode',
                                    style: const TextStyle(
                                        fontFamily: 'DMSans', fontSize: 12),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.border_color_outlined,
                                      color: Colors.orange,
                                    ),
                                    onPressed: () {
                                      editPengalaman(
                                        context,
                                        perusahaan.id!.toInt(),
                                        perusahaan.posisi.toString(),
                                        perusahaan.perusahaan.toString(),
                                        perusahaan.tglMulai.toString(),
                                        perusahaan.tglSelesai.toString(),
                                      );
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
