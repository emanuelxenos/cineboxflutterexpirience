import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static const titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const subTitleSmall = TextStyle(
    fontSize: 14,
    color: AppColors.lightGrey,
  );

  static final boldSmall = subTitleSmall.copyWith(
    fontWeight: FontWeight.bold,
  );

  static final regularSmall = subTitleSmall.copyWith(
    fontWeight: FontWeight.w400,
  );

  static const boldMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final semiBoldMedium = boldMedium.copyWith(
    fontWeight: FontWeight.w600,
  );

  static const lightGreyRegular = TextStyle(
    fontSize: 14,
    color: AppColors.lightGrey,
  );

  final lightGreySmall = lightGreyRegular.copyWith(
    fontSize: 12,
  );

  static const errorText = TextStyle(
    color: AppColors.redColor,
  );
}
