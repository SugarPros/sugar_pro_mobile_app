import 'package:sugar_pros/core/utils/exports.dart';

/// Design system text styles that adapt to theme changes
class BrandTextStyles {
  BrandTextStyles._();

  /// Returns a regular text style that adapts to the current theme
  static TextStyle get regular {
    final BuildContext context = StackedService.navigatorKey!.currentContext!;
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: 1.50,
        );
  }

  /// Returns a medium text style that adapts to the current theme
  static TextStyle get medium {
    final BuildContext context = StackedService.navigatorKey!.currentContext!;
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          height: 1.50,
        );
  }

  /// Returns a semi-bold text style that adapts to the current theme
  static TextStyle get semiBold {
    final BuildContext context = StackedService.navigatorKey!.currentContext!;
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          height: 1.50,
        );
  }

  /// Returns a bold text style that adapts to the current theme
  static TextStyle get bold {
    final BuildContext context = StackedService.navigatorKey!.currentContext!;
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          height: 1.50,
        );
  }

  /// Returns an extra-bold text style that adapts to the current theme
  static TextStyle get extraBold {
    final BuildContext context = StackedService.navigatorKey!.currentContext!;
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w800,
          height: 1.50,
        );
  }
}