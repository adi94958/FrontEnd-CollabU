import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ringkasan_state.dart';

class RingkasanCubit extends Cubit<RingkasanState> {
  RingkasanCubit() : super(RingkasanInitial());

  void editRingkasan(String ringkasan) {
    emit(EditRingkasan(ringkasan: ringkasan));
  }

  void resetRingkasan() {
    emit(RingkasanInitial());
  }
}
