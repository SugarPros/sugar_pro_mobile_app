import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/patient_account_viewmodel.dart';

class PaPersonalDetails extends StatelessWidget {
  const PaPersonalDetails({super.key});

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
                      20.verticalSpace,
                      Text(
                        'Patient Sign Up',
                        style: BrandTextStyles.semiBold.copyWith(
                          fontSize: 24.sp,
                          color: hexColor('#041915'),
                        ),
                      ),
                      Text(
                        'Enter your credentials to access your account',
                        style: BrandTextStyles.regular.copyWith(
                          fontSize: 16.sp,
                          color: hexColor('#64748B'),
                        ),
                      ),
                      30.verticalSpace,
                      CustomTextField(
                        label: 'Full name',
                        hintText: 'Enter your name',
                      ),
                      20.verticalSpace,
                      CustomTextField(
                        label: 'Email',
                        hintText: 'Enter your email',
                      ),
                      20.verticalSpace,
                      CustomTextField(
                        label: 'Mobile Number',
                        hintText: 'Enter phone number',
                      ),
                      20.verticalSpace,
                      CustomTextField(
                        label: 'Password',
                        hintText: 'Enter your password',
                      ),
                      20.verticalSpace,
                      CustomTextField(
                        label: 'Confirm Password',
                        hintText: 'Confirm your password',
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Container(
                            width: 17.w,
                            height: 17.w,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                                side: BorderSide(color: hexColor('#D1D5DC')),
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          Text(
                            'Agreement to Terms & Conditions',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#3D3D3D'),
                            ),
                          ),
                        ],
                      ),
                      40.verticalSpace,
                      CustomButton(
                        onTap: () {
                          node.unfocus();
                          viewModel.forward();
                        },
                        title: 'Sign Up',
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
