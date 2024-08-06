import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_app/core/base/widget/base_button_widget.dart';
import 'package:news_app/core/base/widget/base_text_field_widget.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/core/helpers/enums.dart';
import 'package:news_app/core/navigation/navigation_center.dart';
import 'package:news_app/features/authentication/presentation/cubit/sign_up_cubit.dart';
import 'package:news_app/features/main/presentation/page/main_screen.dart';
import 'package:news_app/generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  Map<String, String> _errorMessages = {};

  String _email = '';

  String _password = '';

  String _confirmPassword = '';

  bool _isObscurePassword = true;

  bool _isObscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _errorMessages = {
          FirebaseAuthErrorCode.weakPassword.get():
              S.of(context).firebaseAuthErrorWeakPassword,
          FirebaseAuthErrorCode.emailAlreadyInUse.get():
              S.of(context).firebaseAuthErrorEmailAlreadyInUse,
          FirebaseAuthErrorCode.passwordAndConfirmPasswordDoNotMatch.get():
              S.of(context).firebaseAuthErrorPasswordAndConfirmPasswordNotMatch,
          FirebaseAuthErrorCode.invalidEmail.get():
              S.of(context).firebaseAuthErrorInvalidEmail,
        };
      },
    );
  }

  String _returnMessageByCode(String code) {
    return _errorMessages[code] ?? S.of(context).firebaseAuthErrorGeneral;
  }

  bool get _isButtonActive =>
      _email.isNotEmpty &&
      _password.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      _isEmailValid();

  bool _isEmailValid() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(_email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              EasyLoading.dismiss();
              NavigationCenter.goToScreen(
                context,
                NavigationCenter.mainScreen,
                const MainScreen(),
              );
            } else if (state is SignUpLoadingState) {
              EasyLoading.show();
            } else if (state is SignUpFailureState) {
              EasyLoading.dismiss();
              String code = state.code;
              AppUtils.showToastMessage(
                _returnMessageByCode(
                  code,
                ),
                context,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(
              32.0,
            ).copyWith(
              top: 8.0,
            ),
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(
                    context,
                  ),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).colorScheme.primary,
                      size: 28.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppConstants.icLogo(
                      context,
                    ),
                    width: MediaQuery.sizeOf(context).width * .4,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  S.of(context).signUpCreateYourAccount,
                  style: AppConstants.textHeadingH5.copyWith(
                    color: Theme.of(context).colorScheme.surfaceTint,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).loginEmail,
                  background: Theme.of(context).colorScheme.scrim,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Theme.of(context).colorScheme.surfaceDim,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  alert: !_isEmailValid() && _email.isNotEmpty,
                  alertMessage: S.of(context).signUpEmailWrongFormat,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).loginPassword,
                  background: Theme.of(context).colorScheme.scrim,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Theme.of(context).colorScheme.surfaceDim,
                  obscureText: _isObscurePassword,
                  suffix: Icon(
                    _isObscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTapSuffix: () => setState(
                    () {
                      _isObscurePassword = !_isObscurePassword;
                    },
                  ),
                  rightPosition: 16.0,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).signUpConfirmPassword,
                  background: Theme.of(context).colorScheme.scrim,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Theme.of(context).colorScheme.surfaceDim,
                  obscureText: _isObscureConfirmPassword,
                  suffix: Icon(
                    _isObscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTapSuffix: () => setState(
                    () {
                      _isObscureConfirmPassword = !_isObscureConfirmPassword;
                    },
                  ),
                  rightPosition: 16.0,
                  onChanged: (value) {
                    setState(() {
                      _confirmPassword = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 32.0,
                ),
                BaseButtonWidget(
                  text: S.of(context).signUp,
                  buttonState: _isButtonActive
                      ? ButtonState.normal
                      : ButtonState.disabled,
                  onClick: () => context.read<SignUpCubit>().signUpAction(
                        _email,
                        _password,
                        _confirmPassword,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
