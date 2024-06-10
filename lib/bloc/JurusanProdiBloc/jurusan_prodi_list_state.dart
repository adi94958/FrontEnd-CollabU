part of 'jurusan_prodi_list_bloc.dart';

sealed class JurusanProdiListState extends Equatable {
  const JurusanProdiListState();

  @override
  List<Object> get props => [];
}

final class JurusanProdiListInitial extends JurusanProdiListState {}

final class JurusanProdiListLoading extends JurusanProdiListState {}

final class JurusanProdiListLoaded extends JurusanProdiListState {
  final List<UserJurusan> jurusan;
  final List<UserProdi> prodi;

  const JurusanProdiListLoaded({required this.jurusan, required this.prodi});
}

final class JurusanProdiListError extends JurusanProdiListState {}
