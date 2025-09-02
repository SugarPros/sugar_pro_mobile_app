import 'package:sugar_pros/core/utils/exports.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function onTap;
  final bool filled;
  final bool disable;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? textSize;
  final EdgeInsets? padding;
  final double? radius;
  final double? height;
  final Widget? child;
  final bool showBorder;
  final bool isLoading;
  final TextStyle? textStyle;

  const CustomButton(
      {super.key,
      this.title,
      required this.onTap,
      this.filled = true,
      this.backgroundColor,
      this.textColor,
      this.textSize,
      this.borderColor,
      this.disable = false,
      this.padding,
      this.radius,
      this.height,
      this.child,
      this.isLoading = false,
      this.showBorder = true,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius ?? 12.r),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (!disable) {
            HapticFeedback.mediumImpact();
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            onTap();
          }
        },
        borderRadius: BorderRadius.circular(100.r),
        child: Container(
          padding: height != null
              ? EdgeInsets.zero
              : padding ??
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          width: double.infinity,
          height: 53.h,
          decoration: BoxDecoration(
              color: disable
                  ? BrandColors. bc979797
                  : filled
                      ? (backgroundColor ?? BrandColors.primary)
                      : null,
              border: !disable
                  ? showBorder
                      ? Border.all(color: backgroundColor ?? BrandColors.primary)
                      : null
                  : Border.all(
                      color: disable
                          ? Colors.transparent
                          : (borderColor ?? const Color(0xFF011B55))),
              borderRadius: BorderRadius.circular(radius ?? 12.r)),
          child: Center(
            child: isLoading
                ? const Center(
                    child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: Colors.white,
                    ),
                  ))
                : child ??
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '$title',
                        style: textStyle ??
                            BrandTextStyles.semiBold.copyWith(
                                fontSize: textSize ?? 16.sp,
                                color: textColor ?? Colors.white,
                                height: 1.875),
                        textAlign: TextAlign.center,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
