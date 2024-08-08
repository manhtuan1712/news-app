import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_constants.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final User? user;

  const ProfileHeaderWidget({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(
            12.0,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(
              90.0,
            ),
          ),
          child: const Icon(
            Icons.person,
            size: 90.0,
          ),
        ),
        const SizedBox(
          width: 24.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.email?.split('@')[0] ?? '',
                style: AppConstants.textHeadingH4.copyWith(
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
              ),
              Text(
                user?.email ?? '',
                style: AppConstants.textBody2Regular.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
