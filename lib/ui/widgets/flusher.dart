import 'package:another_flushbar/flushbar.dart';
import 'package:sugar_pros/core/utils/exports.dart';

/// A Customize flushbar widget to be use across development for quick message.
/// String [message]
/// BuildContext [context]
/// Position argument for the duration, only use when you want longer message time.
/// Duration [sec]
Flushbar flusher(String message,
    {int sec = 3,
    Color? color,
    String? title,
    bool network = false,
    bool info = true}) {
  late Flushbar flush;
  // ignore: join_return_with_assignment
  flush = Flushbar(
    isDismissible: true,
    blockBackgroundInteraction: true,
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    backgroundColor: color ?? const Color(0xFF0B711B),
    maxWidth: 320.w,
    margin: EdgeInsets.symmetric(vertical: 20.h),
    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
    borderRadius: BorderRadius.circular(12.r),
    duration: Duration(seconds: sec),
    title: title,
    messageText: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style:BrandTextStyles.medium.copyWith()
              .copyWith(fontSize: 17.sp, color: Colors.white),
        ),
      ],
    ),
  )..show(StackedService.navigatorKey!.currentContext!);

  return flush;
}
