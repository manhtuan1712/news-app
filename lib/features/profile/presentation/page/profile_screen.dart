import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/base/widget/base_button_widget.dart';
import 'package:news_app/core/helpers/app_utils.dart';
import 'package:news_app/features/authentication/presentation/page/login_screen.dart';
import 'package:news_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:news_app/features/profile/presentation/widget/profile_header_widget.dart';
import 'package:news_app/generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<ProfileCubit>().getCurrentUser(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogOutSuccessState) {
          Navigator.pushAndRemoveUntil(
            AppUtils.contextMain,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 32.0,
          ),
          child: BaseButtonWidget(
            text: S.of(context).logOut,
            buttonState: ButtonState.normal,
            onClick: () => context.read<ProfileCubit>().logOut(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 32.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocSelector<ProfileCubit, ProfileState, User?>(
                  selector: (state) {
                    if (state is ProfileGetCurrentUserState) {
                      return state.user;
                    }
                    return null;
                  },
                  builder: (context, user) => ProfileHeaderWidget(
                    user: user,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 24.0,
                  ),
                  child: Divider(
                    height: 1.0,
                    color: Theme.of(context).colorScheme.secondary,
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
