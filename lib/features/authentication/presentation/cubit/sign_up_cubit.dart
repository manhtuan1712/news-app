import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/authentication/domain/usecase/sign_up.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUp signUp;

  SignUpCubit({
    required this.signUp,
  }) : super(SignUpInitialState());

  Future<void> signUpAction(
    String email,
    String password,
    String confirmPassword,
  ) async {
    emit(SignUpLoadingState());
    final failureOrSignUp = await signUp(
      SignUpParams(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    failureOrSignUp.fold(
      (failure) => emit(
        SignUpFailureState(
          code: failure.code,
        ),
      ),
      (user) => emit(
        SignUpSuccessState(),
      ),
    );
  }
}
