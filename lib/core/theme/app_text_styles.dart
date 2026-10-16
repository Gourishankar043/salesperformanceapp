  import 'package:flutter/material.dart';

  import 'app_colors.dart';
  import 'app_dimensions.dart';

  class AppTextStyles {
    AppTextStyles._();
    static const TextStyle title = TextStyle(
      fontSize: AppDimensions.fontSize22,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );

    static const TextStyle pageTitle = TextStyle(
      fontSize: AppDimensions.fontSize36,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );

    static const TextStyle sectionTitle = TextStyle(
      fontSize: AppDimensions.fontSize18,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );

    static const TextStyle heading = TextStyle(
      fontSize: AppDimensions.fontSize16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );

    static const TextStyle subtitle = TextStyle(
      fontSize: AppDimensions.fontSize14,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    );
    static const TextStyle body = TextStyle(
      fontSize: AppDimensions.fontSize14,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
      height: AppDimensions.lineHeightBody,
    );

    static const TextStyle bodyMedium = TextStyle(
      fontSize: AppDimensions.fontSize14,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    );

    static const TextStyle bodyLarge = TextStyle(
      fontSize: AppDimensions.fontSize16,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    );

    static const TextStyle caption = TextStyle(
      fontSize: AppDimensions.fontSize12,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    );

    static const TextStyle label = TextStyle(
      fontSize: AppDimensions.fontSize12,
      fontWeight: FontWeight.w600,
      color: AppColors.textSecondary,
    );
    static const TextStyle metricValue = TextStyle(
      fontSize: AppDimensions.fontSize22,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );

    static const TextStyle metricLarge = TextStyle(
      fontSize: AppDimensions.fontSize32,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );

    static const TextStyle metricLabel = TextStyle(
      fontSize: AppDimensions.fontSize13,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    );
    static const TextStyle button = TextStyle(
      fontSize: AppDimensions.fontSize14,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    );
    static const TextStyle dropdownItem = TextStyle(
      fontSize: AppDimensions.fontSize14,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    );
  }