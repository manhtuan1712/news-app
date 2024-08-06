import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_app/core/base/widget/base_button_widget.dart';
import 'package:news_app/core/base/widget/base_text_field_widget.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/core/helpers/enums.dart';
import 'package:news_app/core/navigation/navigation_center.dart';
import 'package:news_app/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:news_app/features/authentication/presentation/page/sign_up_screen.dart';
import 'package:news_app/features/main/presentation/page/main_screen.dart';
import 'package:news_app/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  Map<String, String> _errorMessages = {};

  String _email = '';

  String _password = '';

  bool _isObscurePassword = true;

  bool get _isButtonActive =>
      _email.isNotEmpty && _password.isNotEmpty && _isEmailValid();

  String _returnMessageByCode(String code) {
    return _errorMessages[code] ?? S.of(context).firebaseAuthErrorGeneral;
  }

  bool _isEmailValid() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(_email);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _errorMessages = {
          FirebaseAuthErrorCode.userDisable.get():
              S.of(context).firebaseAuthErrorDisable,
          FirebaseAuthErrorCode.userNotFound.get():
              S.of(context).firebaseAuthErrorNotFound,
          FirebaseAuthErrorCode.wrongPassword.get():
              S.of(context).firebaseAuthErrorWrongPassword,
          FirebaseAuthErrorCode.invalidEmail.get():
              S.of(context).firebaseAuthErrorInvalidEmail,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              EasyLoading.dismiss();
              NavigationCenter.goToScreen(
                context,
                NavigationCenter.mainScreen,
                const MainScreen(),
              );
            } else if (state is LoginLoadingState) {
              EasyLoading.show();
            } else if (state is LoginFailureState) {
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
            ),
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  S.of(context).loginToYourAccount,
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
                  height: 32.0,
                ),
                BaseButtonWidget(
                  text: S.of(context).loginSignIn,
                  buttonState: _isButtonActive
                      ? ButtonState.normal
                      : ButtonState.disabled,
                  onClick: () => context.read<LoginCubit>().loginAction(
                        _email,
                        _password,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          32.0,
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: '${S.of(context).loginDoNotHaveAnAccount} ',
                style: AppConstants.textBody1Regular.copyWith(
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
              ),
              TextSpan(
                text: S.of(context).loginSignUp,
                style: AppConstants.textBody1Regular.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    NavigationCenter.goToScreen(
                      context,
                      NavigationCenter.signUpScreen,
                      const SignUpScreen(),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
