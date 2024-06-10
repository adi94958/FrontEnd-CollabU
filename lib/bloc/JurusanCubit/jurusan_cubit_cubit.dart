import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'jurusan_cubit_state.dart';

class JurusanCubitCubit extends Cubit<JurusanCubitState> {
  JurusanCubitCubit() : super(JurusanCubitInitial());

  void editData(String jurusan, String prodi, String tahun) {
    emit(JurusanCubitEdit(jurusan: jurusan, prodi: prodi, tahun: tahun));
  }

  void resetData() {
    emit(JurusanCubitInitial());
  }
}
