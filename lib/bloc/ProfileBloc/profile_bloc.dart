import 'package:collab_u/model/user_profile.dart';
import 'package:collab_u/services/user_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfile>((event, emit) async {
      try {
        emit(ProfileLoading());
        final UserProfile profile = await UserApi.fetchUsers();
        print(profile);
        emit(ProfileLoaded(profile));
      } catch (e) {
        // ignore: avoid_print
        emit(ProfileError());
        print(e);
      }
    });
  }
}
