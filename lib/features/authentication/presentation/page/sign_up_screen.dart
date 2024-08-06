import 'package:flutter/material.dart';
import 'package:news_app/core/base/widget/base_button_widget.dart';
import 'package:news_app/core/base/widget/base_text_field_widget.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
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
              const SizedBox(
                height: 20.0,
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
                obscureText: true,
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
                obscureText: true,
              ),
              const SizedBox(
                height: 32.0,
              ),
              BaseButtonWidget(
                text: S.of(context).signUp,
                onClick: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
