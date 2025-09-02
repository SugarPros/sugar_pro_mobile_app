import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/provider_account/provider_account_viewmodel.dart';

class ProvPage2 extends StatelessWidget {
  const ProvPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<ProviderAccountViewModel>(
      builder:
          (context, viewModel) => Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('logo'.png, height: 36.h),
                    40.verticalSpace,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('logo'.png, height: 44.h),
                          20.verticalSpace,
                          Text(
                            'Verify Your Email Address',
                            style: BrandTextStyles.regular.copyWith(
                              color: hexColor('#525252'),
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            'Enter the OTP sent to your Email',
                            style: BrandTextStyles.medium.copyWith(
                              color: hexColor('#121212'),
                              fontSize: 24.sp,
                            ),
                          ),
                          30.verticalSpace,
                          CustomTextField(
                            label: 'OTP Code',
                            hintText: 'Enter code here',
                          ),
                          25.verticalSpace,
                          CustomButton(
                            onTap: () {
                              viewModel.navigateToLogin();
                            },
                            title: 'Confirm',
                          ),
                          10.verticalSpace,
                          TextButton(
                            onPressed: () {},
                            child: Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      style: BrandTextStyles.regular.copyWith(
                                        color: hexColor('#3E3E3E'),
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Log in',
                                      style: BrandTextStyles.medium.copyWith(
                                        color: hexColor('#2889AA'),
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
