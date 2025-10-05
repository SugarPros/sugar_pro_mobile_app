import 'package:intl_phone_field/phone_number.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/patient_signup/patient_signup_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/custom_phone_field.dart';

class PaPersonalDetails extends StatelessWidget {
   const PaPersonalDetails({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FocusNode node = FocusScope.of(context);
    return BasePartialBuild<PatientSignupViewModel>(
      builder:
          (context, viewModel) => Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          label: 'Username',
                          hintText: 'Enter your username',
                          controller: viewModel.usernameCtrl,
                        ),
                        20.verticalSpace,
                        CustomTextField(
                          label: 'Email',
                          hintText: 'Enter your email',
                          type: TextFieldType.email,
                          inputType: TextInputType.emailAddress,
                          controller: viewModel.emailCtrl,
                        ),
                        20.verticalSpace,
                        CustomPhoneField(
                          label: 'Mobile Number',
                          validate: true,
                          controller: viewModel.mobileNumberCtrl,
                          onChanged: (PhoneNumber? val) {
                            if (val != null) {
                              String countryCode = val.countryCode;
                              String phoneNumber = val.number;
                              String fullNumber = val.completeNumber;
                                              
                              debugPrint("Country Code: $countryCode");
                              debugPrint("Phone Number: $phoneNumber");
                              debugPrint("Full Number: $fullNumber");
                            }
                          },
                        ),
                        20.verticalSpace,
                        CustomTextField(
                          label: 'Password',
                          hintText: 'Enter your password',
                          obscure: viewModel.obscurePassword,
                          suffixFunc:
                              () => viewModel.obscurePassword = !viewModel.obscurePassword,
                        ),
                        20.verticalSpace,
                        CustomTextField(
                          label: 'Confirm Password',
                          hintText: 'Confirm your password',
                          obscure: viewModel.obscureConfirmPassword,
                          suffixFunc:
                              () =>
                                  viewModel.obscureConfirmPassword =
                                      !viewModel.obscureConfirmPassword,
                        ),
                        20.verticalSpace,
                        Row(
                          children: [
                            InkWell(
                              onTap: () => viewModel.toggleAggrement(),
                              child: Container(
                                width: 17.w,
                                height: 17.w,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    side: BorderSide(color: hexColor('#D1D5DC')),
                                  ),
                                ),
                                child:
                                    viewModel.isAgree
                                        ? Center(
                                          child: Icon(
                                            Icons.check,
                                            color: BrandColors.primary,
                                            size: 15.h,
                                          ),
                                        )
                                        : const SizedBox.shrink(),
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
                        InkWell(
                          onTap: viewModel.navigateToPatientLogin,
                          child: Center(
                            child: Text.rich(
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
                          ),
                        ),
                        SizedBox(height: 20.h + bottomPadding(context)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
