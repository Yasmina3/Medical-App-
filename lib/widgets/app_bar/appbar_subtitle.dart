import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: SizedBox(
          width: 75.h,
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.titleLargeOnPrimaryContainer.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              height: 1.45,
            ),
          ),
        ),
      ),
    );
  }
}
