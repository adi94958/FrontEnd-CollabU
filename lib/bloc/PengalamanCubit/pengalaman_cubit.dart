import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pengalaman_state.dart';

class PengalamanCubit extends Cubit<PengalamanState> {
  PengalamanCubit() : super(PengalamanInitial());

  void editPengalaman(int id, String posisi, String perusahaan, String tglMulai,
      String tglSelesai) {
    emit(PengalamanEdit(
        id: id,
        posisi: posisi,
        perusahaan: perusahaan,
        tglMulai: tglMulai,
        tglSelesai: tglSelesai));
  }

  void clearPengalaman() {
    emit(PengalamanInitial());
  }
}
