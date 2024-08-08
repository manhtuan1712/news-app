part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileGetCurrentUserState extends ProfileState {
  final User? user;

  ProfileGetCurrentUserState({
    this.user,
  });
}
