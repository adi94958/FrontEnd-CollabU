part of 'ringkasan_cubit.dart';

sealed class RingkasanState extends Equatable {
  const RingkasanState();

  @override
  List<Object> get props => [];
}

final class RingkasanInitial extends RingkasanState {}

final class EditRingkasan extends RingkasanState {
  final String ringkasan;

  const EditRingkasan({required this.ringkasan});
}
