import 'package:sugar_pros/core/utils/exports.dart';

class BackWrapper2 extends StatefulWidget {
  const BackWrapper2({
    super.key,
    this.title,
    this.onBackPressed,
    required this.child,
    this.padding,
    this.titleColor,
    this.backgroundColor,
    this.trailing,
    this.backBtnColor,
    this.hasBackButton = false,
    this.showBottomNav = true,
    this.subtitle,
    this.icon,
    this.cancelIcon = false,
  });

  final String? title;
  final Color? titleColor;
  final Function? onBackPressed;
  final Color? backBtnColor;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;
  final bool hasBackButton;
  final Color? backgroundColor;
  final bool? showBottomNav;
  final Widget? icon;
  final String? subtitle;
  final bool cancelIcon;

  @override
  State<BackWrapper2> createState() => _BackWrapper2State();
}

class _BackWrapper2State extends State<BackWrapper2> {
  late bool canPop;

  @override
  void initState() {
    super.initState();
    canPop = StackedService.navigatorKey!.currentState!.canPop();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.isDarkMode ? Utils.darkThemeNav() : Utils.lightThemeNav,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Image.asset(
                      context.isDarkMode ? 'tatum-logo-bg'.png : 'tatum-logo'.png,
                      height: 215.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60.h),
                        Row(
                          crossAxisAlignment:
                              widget.subtitle != null
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                          children: [
                            widget.hasBackButton
                                ? InkWell(
                                  onTap: () => widget.onBackPressed!(),
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Padding(
                                    padding: EdgeInsets.all(6.w),
                                    child: SvgPicture.asset(
                                      widget.cancelIcon ? 'x'.svg : 'back'.svg,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).svgColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                )
                                : canPop
                                ? InkWell(
                                  borderRadius: BorderRadius.circular(100.r),
                                  onTap: () {
                                    widget.onBackPressed == null
                                        ? locator<NavigationService>().back()
                                        : widget.onBackPressed!();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(6.w),
                                    child: SvgPicture.asset(
                                      widget.cancelIcon ? 'x'.svg : 'back'.svg,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).svgColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                )
                                : const SizedBox.shrink(),
                            SizedBox(width: 9.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title ?? '',
                                    style: BrandTextStyles.bold.copyWith(
                                      color:
                                          context.isDarkMode
                                              ? Colors.white
                                              : const Color(0xFF002244),
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  if (widget.subtitle != null)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 0.h),
                                        Text(
                                          widget.subtitle ?? '',
                                          style: BrandTextStyles.regular.copyWith(
                                            color:
                                                context.isDarkMode
                                                    ? Colors.white
                                                    : const Color(0xFF292D32),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            widget.icon ?? const SizedBox.shrink(),
                          ],
                        ),
                        SizedBox(height: 27.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ColoredBox(
                color: Colors.transparent,
                child: Padding(
                  padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 18.w),
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
