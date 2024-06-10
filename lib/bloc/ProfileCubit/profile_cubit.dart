import 'package:bloc/bloc.dart';
import 'package:collab_u/model/user.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void editProfile(User user, String? pendidikan) {
    emit(ProfileEdit(user: user, pendidikan: pendidikan));
  }

  void resetProfile() {
    emit(ProfileInitial());
  }
}
