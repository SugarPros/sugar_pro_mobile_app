import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/login/provider_login/provider_login_viewmodel.dart';

class ProviderLoginView extends StackedView<ProviderLoginViewModel> {
  const ProviderLoginView({super.key});

  @override
  Widget builder(BuildContext context, ProviderLoginViewModel viewModel, Widget? child) {
    return Scaffold(
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
                        'Provider Log In',
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
                        label: 'Email',
                        inputType: TextInputType.emailAddress,
                        type: TextFieldType.email,
                        hintText: 'Enter your email',
                        initalValue: viewModel.user?.loginUsername,
                        onChanged: (val) => viewModel.email = val,
                      ),
                      20.verticalSpace,
                      CustomTextField(
                        controller: viewModel.passwordCtrl,
                        label: 'Password',
                        hintText: 'Enter your password',
                        obscure: viewModel.obscurePassword,
                        type: TextFieldType.setPassword,
                        suffixFunc: () => viewModel.obscurePassword = !viewModel.obscurePassword,
                        onChanged: (value) {
                          viewModel.password = value;
                        },
                      ),
                      15.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: BrandTextStyles.medium.copyWith(
                            color: hexColor('#3D3D3D'),
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      25.verticalSpace,
                      CustomButton(
                        onTap: () {
                          viewModel.login();
                          // viewModel.navigateToProviderDashboard();
                        },
                        title: 'Log In',
                      ),
                      10.verticalSpace,
                      TextButton(
                        onPressed: viewModel.navigateToProviderAccount,
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: BrandTextStyles.regular.copyWith(
                                    color: hexColor('#3E3E3E'),
                                    fontSize: 14.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
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
    );
  }

  @override
  ProviderLoginViewModel viewModelBuilder(BuildContext context) => ProviderLoginViewModel();
}
