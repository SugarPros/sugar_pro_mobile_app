import 'package:sugar_pros/core/utils/exports.dart';

class BackWrapper extends StatefulWidget {
  const BackWrapper({
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
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.showBottomNav = true,
    this.navColor,
    this.height,
  });

  final String? title;
  final Color? titleColor;
  final Function? onBackPressed;
  final Color? backBtnColor;
  final Widget child;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;
  final bool hasBackButton;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final bool? showBottomNav;
  final Color? navColor;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  State<BackWrapper> createState() => _BackWrapperState();
}

class _BackWrapperState extends State<BackWrapper> {
  late bool canPop;

  @override
  void initState() {
    super.initState();
    canPop = StackedService.navigatorKey!.currentState!.canPop();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          context.isDarkMode
              ? Utils.darkThemeNav(navColor: widget.navColor)
              : Utils.lightThemeNav,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        widget.hasBackButton
                            ? InkWell(
                              onTap: () => widget.onBackPressed!(),
                              borderRadius: BorderRadius.circular(100.r),
                              child: Container(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: EdgeInsets.all(2.w),
                                  child: SvgPicture.asset(
                                    'arrow-left'.svg,
                                    height: 25.h,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context).svgColor,
                                      BlendMode.srcIn,
                                    ),
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
                              child: Container(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: EdgeInsets.all(2.w),
                                  child: SvgPicture.asset(
                                    'arrow-left'.svg,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context).svgColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            : const SizedBox.shrink(),
                        SizedBox(width: 9.w),
                        Text(
                          widget.title ?? '',
                          style: BrandTextStyles.bold.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              Expanded(
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding:
                        widget.padding ??
                        EdgeInsets.symmetric(horizontal: 23.w),
                    child: widget.child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
