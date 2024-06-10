part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileEdit extends ProfileState {
  final User user;
  final String? pendidikan;

  const ProfileEdit({required this.user, this.pendidikan});
}
