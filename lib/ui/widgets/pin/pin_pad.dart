import 'package:sugar_pros/ui/widgets/pin/pin_pad_viewmodel.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/widgets/remove_glow.dart';
import 'package:flutter/scheduler.dart';

class PinPad extends StatefulWidget {
  final ScrollController controller;
  final String? btnText;
  final String? subText;
  final int? transactionType;
  final ValueChanged<String> onDone;

  const PinPad({
    super.key,
    this.btnText,
    this.subText,
    this.transactionType,
    required this.onDone,
    required this.controller,
  });

  @override
  PinPadState createState() => PinPadState();
}

class PinPadState extends State<PinPad> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PinPadViewModel>.reactive(
      viewModelBuilder: () => PinPadViewModel(),
      onViewModelReady: (viewModel) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          viewModel.setup();
          // if ((viewModel.useBiometricTransaction) && (viewModel.isDeviceSupported ?? false)) {
          //   viewModel.authenticateWithBiometrics(onDone: (pin) => widget.onDone(pin));
          // }
        });
      },
      builder:
          (context, viewModel, child) => StatefulBuilder(
            builder:
                (context, modalstate) => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  child: Material(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                    child: Stack(
                      children: [
                        RemoveGlow(
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            controller: widget.controller,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.verticalSpace,
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Enter PIN',
                                        style: BrandTextStyles.extraBold.copyWith(
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.of(context).pop(),
                                        child: Image.asset('close'.png, height: 30.h),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                                  child: Text(
                                    widget.subText ?? 'Enter Transaction PIN to authorize Transfer',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ),
                               30.verticalSpace,
                                Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      pinIndicatorItem(
                                        isActive: viewModel.pin.isEmpty,
                                        isFilled: viewModel.pin.isNotEmpty,
                                      ),
                                      SizedBox(width: 12.w),
                                      pinIndicatorItem(
                                        isActive: viewModel.pin.length == 1,
                                        isFilled: viewModel.pin.length > 1,
                                      ),
                                      SizedBox(width: 12.w),
                                      pinIndicatorItem(
                                        isActive: viewModel.pin.length == 2,
                                        isFilled: viewModel.pin.length > 2,
                                      ),
                                      SizedBox(width: 12.w),
                                      pinIndicatorItem(
                                        isActive: viewModel.pin.length == 3,
                                        isFilled: viewModel.pin.length > 3,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 26.h),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          keyPad(
                                            context: context,
                                            text: '1',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                          keyPad(
                                            context: context,
                                            text: '2',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                          keyPad(
                                            context: context,
                                            text: '3',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          keyPad(
                                            context: context,
                                            text: '4',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                          keyPad(
                                            context: context,
                                            text: '5',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                          keyPad(
                                            context: context,
                                            text: '6',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          keyPad(
                                            context: context,
                                            text: '7',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                          keyPad(
                                            context: context,
                                            text: '8',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                          keyPad(
                                            context: context,
                                            text: '9',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          if (viewModel.storedPin == null ||
                                              !viewModel.useBiometricTransaction ||
                                              !(viewModel.isBiometricsAvailable ?? false) ||
                                              !(viewModel.isDeviceSupported ?? false))
                                            Container(width: 80.w)
                                          else
                                            InkWell(
                                              onTap: () {
                                                HapticFeedback.heavyImpact();
                                                viewModel.authenticateWithBiometrics(
                                                  onDone: (pin) {
                                                    widget.onDone(pin);
                                                  },
                                                );
                                              },
                                              child: SizedBox(
                                                width: 80.w,
                                                child: SvgPicture.asset(
                                                  Platform.isIOS
                                                      ? 'face_id'.svg
                                                      : 'fingerprint'.svg,
                                                  height: 35.h,
                                                  colorFilter: ColorFilter.mode(
                                                    Theme.of(context).svgColor,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          keyPad(
                                            showBorder: false,
                                            context: context,
                                            text: '0',
                                            func:
                                                (text) => modalstate(() {
                                                  viewModel.pin = text;
                                                }),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (viewModel.pin.isNotEmpty) {
                                                HapticFeedback.heavyImpact();
                                                modalstate(() {
                                                  viewModel.deletePin();
                                                });
                                              }
                                            },
                                            borderRadius: BorderRadius.circular(16.r),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 30.h),
                                              width: 80.w,
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'delete'.svg,
                                                  height: 20.h,
                                                  colorFilter: ColorFilter.mode(
                                                    Theme.of(context).svgColor,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: IntrinsicHeight(
                            child: Container(
                              padding: EdgeInsets.only(
                                right: 20.w,
                                top: 20.h,
                                bottom: 15.h + bottomPadding(context),
                                left: 20.w,
                              ),
                              child: CustomButton(
                                title: widget.btnText ?? 'Submit Transfer',
                                radius: 5,
                                onTap: () {
                                  if (viewModel.pin.isNotEmpty && viewModel.pin.length == 4) {
                                    locator<NavigationService>().back();
                                    widget.onDone(viewModel.pin);
                                  } else {
                                    if (viewModel.pin.isEmpty) {
                                      flusher('Please input your pin', color: Colors.red);
                                      return;
                                    }
                                    if (viewModel.pin.length < 4) {
                                      flusher('Invalid pin', color: Colors.red);
                                      return;
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
    );
  }

  Widget pinIndicatorItem({required bool isActive, required bool isFilled}) {
    if (context.isDarkMode) {
      return Container(
        width: 52.w,
        height: 52.w,
        decoration: BoxDecoration(
          color: isActive ? const Color(0XFF19354D) : const Color(0xFF202020),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: isActive ? const Color(0xFFD9D9D9) : const Color(0xFFD9D9D9)),
        ),
        child:
            isFilled
                ? Center(child: Image.asset('obscure'.png, height: 13.h, color: Colors.white))
                : Center(child: Container(width: 2.w, height: 25.h, color: Colors.transparent)),
      );
    } else {
      return Container(
        width: 52.w,
        height: 52.w,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFFFFFFF) : const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: isActive ? const Color(0xFFFFCC33) : const Color(0xFFD9D9D9)),
        ),
        child:
            isFilled
                ? Center(child: Image.asset('obscure'.png, height: 13.h))
                : Center(child: Container(width: 2.w, height: 25.h, color: Colors.transparent)),
      );
    }
  }

  Widget keyPad({
    required BuildContext context,
    required String text,
    required ValueChanged<String> func,
    bool showBorder = true,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.heavyImpact();
          func(text);
        },
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          width: 80.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: showBorder ? hexColor('#E3E5E8') : Colors.transparent),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: BrandTextStyles.bold.copyWith(
                fontSize: 24.sp,
                height: 1.167,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
