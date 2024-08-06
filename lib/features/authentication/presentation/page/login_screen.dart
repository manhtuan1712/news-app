import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/base/widget/base_button_widget.dart';
import 'package:news_app/core/base/widget/base_text_field_widget.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/core/navigation/navigation_center.dart';
import 'package:news_app/features/authentication/presentation/page/sign_up_screen.dart';
import 'package:news_app/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              ),
              const SizedBox(
                height: 32.0,
              ),
              BaseButtonWidget(
                text: S.of(context).loginSignIn,
                onClick: () {},
              )
            ],
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
