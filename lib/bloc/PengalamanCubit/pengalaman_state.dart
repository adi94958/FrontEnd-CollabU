part of 'pengalaman_cubit.dart';

sealed class PengalamanState extends Equatable {
  const PengalamanState();

  @override
  List<Object> get props => [];
}

final class PengalamanInitial extends PengalamanState {}

final class PengalamanEdit extends PengalamanState {
  final int id;
  final String posisi;
  final String perusahaan;
  final String tglMulai;
  final String tglSelesai;

  const PengalamanEdit(
      {required this.id,
      required this.posisi,
      required this.perusahaan,
      required this.tglMulai,
      required this.tglSelesai});
}
