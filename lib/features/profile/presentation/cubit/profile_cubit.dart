import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  void getCurrentUser() {
    User? user = FirebaseAuth.instance.currentUser;
    debugPrint('==========> user: ${user.toString()}');
    emit(
      ProfileGetCurrentUserState(
        user: user,
      ),
    );
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    emit(
      ProfileLogOutSuccessState(),
    );
  }
}
