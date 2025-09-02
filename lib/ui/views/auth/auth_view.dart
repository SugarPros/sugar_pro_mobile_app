import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/auth_viewmodel.dart';

class AuthView extends StackedView<AuthViewModel> {
  const AuthView({super.key});

  @override
  Widget builder(BuildContext context, AuthViewModel viewModel, Widget? child) {
    return AnnotatedRegion(
      value: Utils.dark,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  20.verticalSpace,
                  Image.asset('logo'.png, height: 52.h),
                  Text(
                    'Are you a Patient or Provider?',
                    style: BrandTextStyles.semiBold.copyWith(
                      color: hexColor('#121212'),
                      fontSize: 24.sp,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    'Select one to access an account.',
                    style: BrandTextStyles.regular.copyWith(
                      color: hexColor('#525252'),
                      fontSize: 16.sp,
                    ),
                  ),
                  27.verticalSpace,
                  AccountType(
                    onTap: viewModel.navigateToPatientRegister,
                    image: 'pat',
                    title: 'Patient Access',
                  ),
                  SizedBox(height: 27.h),
                  AccountType(
                    onTap: viewModel.navigateToProviderRegister,
                    image: 'prov',
                    title: 'Provider Access',
                  ),
                  SizedBox(height: 80.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By continuing, you agree to our ',
                          style: BrandTextStyles.regular.copyWith(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'terms and condition',
                          style: BrandTextStyles.regular.copyWith(
                            color: const Color(0xFFE3904C),
                            fontSize: 18.sp,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: BrandTextStyles.regular.copyWith(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'privacy policy.',
                          style: BrandTextStyles.regular.copyWith(
                            color: const Color(0xFFE3904C),
                            fontSize: 18.sp,
                            fontFamily: 'Euclid Circular A',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  AuthViewModel viewModelBuilder(BuildContext context) => AuthViewModel();
}

class AccountType extends StatelessWidget {
  const AccountType({super.key, required this.onTap, required this.image, required this.title});

  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: hexColor('#E2E8F0')),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image.png, width: double.infinity),
          20.verticalSpace,
          Text(
            title,
            style: BrandTextStyles.semiBold.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
            ),
          ),
          25.verticalSpace,
          CustomButton(
            onTap: onTap,
            title: 'Select',
            borderColor: hexColor('#2889AA'),
            showBorder: true,
            filled: false,
            textColor: hexColor('#2889AA'),
            radius: 7.r,
          ),
        ],
      ),
    );
  }
}
