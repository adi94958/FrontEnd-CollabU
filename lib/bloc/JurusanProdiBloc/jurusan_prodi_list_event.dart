part of 'jurusan_prodi_list_bloc.dart';

sealed class JurusanProdiListEvent extends Equatable {
  const JurusanProdiListEvent();

  @override
  List<Object> get props => [];
}

class GetJurusan extends JurusanProdiListEvent {}
