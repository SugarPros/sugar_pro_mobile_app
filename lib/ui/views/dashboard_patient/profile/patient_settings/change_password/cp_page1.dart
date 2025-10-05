// ignore_for_file: deprecated_member_use
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_password/change_password_viewmodel.dart';

class CpPage1 extends StatefulWidget {
  const CpPage1({super.key});

  @override
  State<CpPage1> createState() => _CpPage1State();
}

class _CpPage1State extends State<CpPage1> with SingleTickerProviderStateMixin {
  late final AnimationController waitDurationController;

  bool _showResend = false;
  bool get showResend => _showResend;
  set showResend(bool val) {
    setState(() {
      _showResend = val;
    });
  }

  void startTimer() {
    waitDurationController.reverse(
      from: waitDurationController.value == 0.0 ? 1.0 : waitDurationController.value,
    );
    showResend = false;
    setState(() {});
  }

  String get getTime {
    Duration duration = waitDurationController.duration! * waitDurationController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    waitDurationController = AnimationController(vsync: this, duration: const Duration(minutes: 1));
    waitDurationController.addListener(() {
      if (waitDurationController.isDismissed) {
        showResend = true;
      }
    });
    startTimer();
  }

  @override
  void dispose() {
    waitDurationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePartialBuild<ChangePasswordViewModel>(
      builder:
          (context, viewModel) => Scaffold(
            backgroundColor: hexColor('#F3F4F6'),
            body: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      70.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => locator<NavigationService>().back(),
                              child: Image.asset('back'.png, height: 46.h),
                            ),
                            Text(
                              'Change Password',
                              style: BrandTextStyles.semiBold.copyWith(
                                fontSize: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 46.w, width: 46.w),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
                10.verticalSpace,
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.verticalSpace,
                          Text(
                            'Enter the code sent to you',
                            style: BrandTextStyles.bold.copyWith(fontSize: 16.sp),
                          ),
                          3.verticalSpace,
                          Text(
                            'Enter the 6-Digit OTP sent to your email to complete verification',
                            style: BrandTextStyles.medium.copyWith(fontSize: 16.sp),
                          ),
                          22.verticalSpace,
                          if (!showResend)
                            Center(
                              child: AnimatedBuilder(
                                animation: waitDurationController,
                                builder:
                                    (context, child) => Text(
                                      getTime,
                                      style: BrandTextStyles.semiBold.copyWith(
                                        color: const Color(0xFFA8A8A8),
                                        fontSize: 20.sp,
                                        height: 1.20,
                                      ),
                                    ),
                              ),
                            ),
                          14.verticalSpace,
                          CustomTextField(
                            label: 'Enter OTP',
                            controller: viewModel.otpCtrl,
                            type: TextFieldType.otp,
                            inputType: TextInputType.number,
                            onChanged: (value) => viewModel.notifyListeners(),
                          ),
                          12.verticalSpace,
                          Text(
                            'Your 6 digit code is on its way. This can sometimes take a few moments to arrive.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 13.sp,
                              color: const Color(0xFF7D7D7D),
                            ),
                          ),
                          26.verticalSpace,
                          CustomButton(
                            disable:
                                (viewModel.otpCtrl.text.isEmpty) ||
                                (viewModel.otpCtrl.text.length < 6),
                            onTap: () {
                              viewModel.confirmOtp();
                            },
                            title: 'Submit',
                          ),
                          14.verticalSpace,
                          if (showResend)
                            InkWell(
                              onTap: () => viewModel.sendOtp(() => startTimer()),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Didn’t receive code? ',
                                      style: BrandTextStyles.semiBold.copyWith(fontSize: 14.sp),
                                    ),
                                    TextSpan(
                                      text: ' Resend',
                                      style: BrandTextStyles.semiBold.copyWith(
                                        color: const Color(0xFFD6A102),
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          30.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
