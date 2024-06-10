part of 'prestasi_cubit.dart';

sealed class PrestasiState extends Equatable {
  const PrestasiState();

  @override
  List<Object> get props => [];
}

final class PrestasiInitial extends PrestasiState {}

final class PrestasiEdit extends PrestasiState {
  final String id;
  final String penghargaan;
  final String kategori;
  final String tahun;

  const PrestasiEdit(
      {required this.id,
      required this.penghargaan,
      required this.kategori,
      required this.tahun});
}
