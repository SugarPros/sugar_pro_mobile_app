import 'package:sugar_pros/core/utils/exports.dart';

class DropdownMock extends StatelessWidget {
  final bool? error;
  final Widget title;
  final Color? bgColor;
  final double? radius;
  final Color? borderColor;

  const DropdownMock({
    super.key,
    this.error = false,
    required this.title,
    this.bgColor,
    this.radius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(radius ?? 7.r),
        border: Border.all(color: error! ? Colors.red : borderColor ?? const Color(0xFFD9D9D9)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: title),
          Icon(Icons.keyboard_arrow_down_rounded, size: 26.h, color: Theme.of(context).svgColor),
        ],
      ),
    );
  }
}
