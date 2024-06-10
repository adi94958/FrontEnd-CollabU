import 'package:collab_u/bloc/JurusanCubit/jurusan_cubit_cubit.dart';
import 'package:collab_u/model/user_pendidikan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void editJurusan(
    BuildContext context,
    String jurusan,
    String prodi,
    String tahun,
  ) {
    context.read<JurusanCubitCubit>().resetData();
    context.read<JurusanCubitCubit>().editData(jurusan, prodi, tahun);
    Navigator.pushNamed(context, '/profil/edit_jurusan');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: dataJurusan != null ? 169 : 70,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        dataJurusan != null
                            ? editJurusan(
                                context,
                                dataJurusan!.jurusan!.namaJurusan!,
                                dataJurusan!.prodi!.namaProdi!,
                                dataJurusan!.tahunMasuk!)
                            : Navigator.pushNamed(
                                context, '/profil/tambah_jurusan');
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      color: Colors.white,
                      height: dataJurusan != null ? 164 - 85 : 0,
                      width: MediaQuery.of(context).size.width - 40,
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
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
