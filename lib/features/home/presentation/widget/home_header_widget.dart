import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/core/helpers/global_configs.dart';
import 'package:news_app/generated/l10n.dart';

class HomeHeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final User? user;

  const HomeHeaderWidget({
    super.key,
    this.user,
  });

  String _getGreeting(
    BuildContext context,
  ) {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 5 && hour < 12) {
      return S.of(context).mainGoodMorning;
    } else if (hour >= 12 && hour < 17) {
      return S.of(context).mainGoodAfternoon;
    } else if (hour >= 17 && hour < 21) {
      return S.of(context).mainGoodEvening;
    } else {
      return S.of(context).mainGoodNight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 9.0,
        horizontal: 32.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${_getGreeting(context)}, \n${user?.email?.split('@')[0] ?? ''}',
            style: AppConstants.textBody2Regular.copyWith(
              color: Theme.of(context).colorScheme.surfaceTint,
            ),
          ),
          Text(
            DateFormat(
              GlobalConfig.dateTimeFormatHeader,
            ).format(
              DateTime.now(),
            ),
            style: AppConstants.textHeadingH5.copyWith(
              color: Theme.of(context).colorScheme.surfaceDim,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        142.0,
      );
}
