part of 'jurusan_cubit_cubit.dart';

sealed class JurusanCubitState extends Equatable {
  const JurusanCubitState();

  @override
  List<Object> get props => [];
}

final class JurusanCubitInitial extends JurusanCubitState {}

final class JurusanCubitEdit extends JurusanCubitState {
  final String jurusan;
  final String prodi;
  final String tahun;

  const JurusanCubitEdit(
      {required this.jurusan, required this.prodi, required this.tahun});
}
