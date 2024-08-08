import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/generated/l10n.dart';

class HomeBodyEmptyWidget extends StatefulWidget {
  const HomeBodyEmptyWidget({super.key});

  @override
  HomeBodyEmptyWidgetState createState() => HomeBodyEmptyWidgetState();
}

class HomeBodyEmptyWidgetState extends State<HomeBodyEmptyWidget> {
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
          S.of(context).mainCanNotFindAnything,
          textAlign: TextAlign.center,
          style: AppConstants.textHeadingH5.copyWith(
            color: Theme.of(context).colorScheme.surfaceDim,
          ),
        ),
      ],
    );
  }
}
