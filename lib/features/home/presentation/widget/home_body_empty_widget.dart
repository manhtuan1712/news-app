import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/helpers/app_constants.dart';

class HomeBodyEmptyWidget extends StatelessWidget {
  final String text;

  const HomeBodyEmptyWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppConstants.icRetry,
          width: 200.0,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppConstants.textHeadingH5.copyWith(
            color: Theme.of(context).colorScheme.surfaceDim,
          ),
        ),
      ],
    );
  }
}
