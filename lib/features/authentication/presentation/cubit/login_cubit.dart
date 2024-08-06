import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/authentication/domain/usecase/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Login login;

  LoginCubit({
    required this.login,
  }) : super(LoginInitialState());

  Future<void> loginAction(
    String email,
    String password,
  ) async {
    emit(LoginLoadingState());
    final failureOrLogin = await login(
      LoginParams(
        email: email,
        password: password,
      ),
    );
    failureOrLogin.fold(
      (failure) => emit(
        LoginFailureState(
          code: failure.code,
        ),
      ),
      (user) => emit(
        LoginSuccessState(),
      ),
    );
  }
}
