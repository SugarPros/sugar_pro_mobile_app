import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/patient_account_viewmodel.dart';

class PaOtp extends StatelessWidget {
  const PaOtp({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FocusNode node = FocusScope.of(context);
    return BasePartialBuild<PatientAccountViewModel>(
      builder:
          (context, viewModel) => Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Column(
                    children: [
                      20.verticalSpace,
                      Center(child: Image.asset('logo'.png, height: 36.h)),
                      150.verticalSpace,
                      Text(
                        'Verify Your Email Address',
                        style: BrandTextStyles.regular.copyWith(
                          fontSize: 16.sp,
                          color: hexColor('#525252'),
                        ),
                      ),
                      Text(
                        'Enter the OTP sent to your Email',
                        style: BrandTextStyles.semiBold.copyWith(
                          fontSize: 24.sp,
                          color: hexColor('#121212'),
                        ),
                      ),
                      30.verticalSpace,
                      CustomTextField(
                        label: 'OTP Code',
                        hintText: 'Enter code here',
                      ),
                      40.verticalSpace,
                      CustomButton(
                        onTap: () {
                          node.unfocus();
                          viewModel.forward();
                        },
                        title: 'Confirm',
                      ),
                      20.verticalSpace,
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: BrandTextStyles.medium.copyWith(
                                color: hexColor('#3E3E3E'),
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: 'Log in',
                              style: BrandTextStyles.medium.copyWith(
                                color: BrandColors.primary,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h + bottomPadding(context)),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
