import 'package:bloc/bloc.dart';
import 'package:collab_u/model/user_jurusan.dart';
import 'package:collab_u/model/user_prodi.dart';
import 'package:collab_u/services/profil_api/jurusan_api.dart';
import 'package:equatable/equatable.dart';

part 'jurusan_prodi_list_event.dart';
part 'jurusan_prodi_list_state.dart';

class JurusanProdiListBloc
    extends Bloc<JurusanProdiListEvent, JurusanProdiListState> {
  JurusanProdiListBloc() : super(JurusanProdiListInitial()) {
    on<GetJurusan>((event, emit) async {
      try {
        print('halo');
        List<UserJurusan> jurusan = await JurusanApi.fetchJurusanUsers();
        List<UserProdi> prodi = await JurusanApi.fetchProdiUsers();
        print("gila");
        print(prodi);
        emit(JurusanProdiListLoaded(jurusan: jurusan, prodi: prodi));
      } catch (e) {
        // ignore: avoid_print
        print("halowoy");
        emit(JurusanProdiListError());
      }
    });
  }
}
