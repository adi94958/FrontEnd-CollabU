import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'prestasi_state.dart';

class PrestasiCubit extends Cubit<PrestasiState> {
  PrestasiCubit() : super(PrestasiInitial());

  void editPrestasi(
      String id, String penghargaan, String kategori, String tahun) {
    emit(PrestasiEdit(
        id: id, penghargaan: penghargaan, kategori: kategori, tahun: tahun));
  }

  void resetPrestasi() {
    emit(PrestasiInitial());
  }
}
