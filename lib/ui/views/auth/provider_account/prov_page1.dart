import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/provider_account/provider_account_viewmodel.dart';

class ProvPage1 extends StatelessWidget {
  const ProvPage1({super.key});

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
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Provider Sign Up',
                              style: BrandTextStyles.medium.copyWith(
                                color: hexColor('#121212'),
                                fontSize: 24.sp,
                              ),
                            ),
                            Text(
                              'Enter your credentials to access your account',
                              style: BrandTextStyles.regular.copyWith(
                                color: hexColor('#525252'),
                                fontSize: 16.sp,
                              ),
                            ),
                            30.verticalSpace,
                            CustomTextField(
                              label: 'Full Name',
                              hintText: 'Enter your name',
                              onChanged: (val) => viewModel.name = val,
                              controller: viewModel.fullNameCtrl,
                            ),
                            20.verticalSpace,
                            CustomTextField(
                              label: 'Email',
                              inputType: TextInputType.emailAddress,
                              type: TextFieldType.email,
                              hintText: 'Enter your email',
                              onChanged: (val) => viewModel.email = val,
                              controller: viewModel.emailCtrl,
                            ),
                            20.verticalSpace,
                            CustomTextField(
                              label: 'Phone',
                              inputType: TextInputType.number,
                              hintText: 'Enter your phone number',
                              onChanged: (val) => viewModel.phone = val,
                              controller: viewModel.phoneCtrl,
                            ),
                            20.verticalSpace,
                            CustomTextField(
                              controller: viewModel.passwordCtrl,
                              label: 'Password',
                              hintText: 'Enter your password',
                              enableInteractiveSelection: false,
                              obscure: viewModel.obscurePassword,
                              type: TextFieldType.setPassword,
                              suffixFunc:
                                  () =>
                                      viewModel.obscurePassword =
                                          !viewModel.obscurePassword,
                              onChanged: (value) {
                                viewModel.password = value;
                              },
                            ),
                            25.verticalSpace,
                            CustomTextField(
                              controller: viewModel.confirmPasswordCtrl,
                              label: 'Confirm Password',
                              hintText: 'Retype your password',
                              enableInteractiveSelection: false,
                              obscure: viewModel.obscureConfirmPassword,
                              type: TextFieldType.password,
                              suffixFunc:
                                  () =>
                                      viewModel.obscureConfirmPassword =
                                          !viewModel.obscureConfirmPassword,
                              onChanged: (value) {
                                viewModel.confirmPassword = value;
                              },
                            ),
                            25.verticalSpace,
                            Row(
                              children: [
                                Container(
                                  width: 15.w,
                                  height: 15.w,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                        width: 1.5,
                                        color: hexColor('#BDBDBD'),
                                      ),
                                    ),
                                  ),
                                ),
                                5.horizontalSpace,
                                Text(
                                  'Agreement to Terms & Conditions',
                                  style: BrandTextStyles.regular.copyWith(
                                    color: hexColor('#3D3D3D'),
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            25.verticalSpace,
                            CustomButton(
                              onTap: () {
                                viewModel.sendOtp();
                              },
                              title: 'Sign Up',
                            ),
                            10.verticalSpace,
                            TextButton(
                              onPressed: locator<NavigationService>().back,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
