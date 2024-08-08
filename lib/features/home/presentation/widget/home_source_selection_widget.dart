import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_constants.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/features/home/data/models/response/source_model.dart';

class HomeSourceSelectionWidget extends StatelessWidget {
  final List<SourceModel> sources;

  final ValueChanged<SourceModel> onSourceSelected;

  final String sourceIdSelected;

  const HomeSourceSelectionWidget({
    super.key,
    required this.sources,
    required this.onSourceSelected,
    required this.sourceIdSelected,
  });

  bool _isSelected(int index) => sourceIdSelected == sources[index].id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sources.isEmpty ? 12.0 : 60.0,
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 32.0,
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => onSourceSelected(
            sources[index],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 10.0,
            ),
            decoration: BoxDecoration(
              color: _isSelected(index)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(
                30.0,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              sources[index].name ?? '',
              style: AppConstants.textBody2Regular.copyWith(
                color: _isSelected(index)
                    ? AppColors.light.colorBackgroundSecondary
                    : Theme.of(context).colorScheme.surfaceTint,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 8.0,
        ),
        itemCount: sources.length,
      ),
    );
  }
}
