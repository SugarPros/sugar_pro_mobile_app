// ignore_for_file: deprecated_member_use
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_email/change_email_viewmodel.dart';

class CePage2 extends StatelessWidget {
  const CePage2({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FocusNode node = FocusScope.of(context);
    return BasePartialBuild<ChangeEmailViewModel>(
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
                              'Change Email',
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Text(
                              'Choose New Password',
                              style: BrandTextStyles.bold.copyWith(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              'Enter your new Password to continue.',
                              style: BrandTextStyles.medium.copyWith(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 23.h),
                            CustomTextField(
                              controller: viewModel.newEmailCtrl,
                              label: 'Enter New Email',
                              hintText: 'Type here',
                              type: TextFieldType.email,
                              inputType: TextInputType.emailAddress,
                            ),
                            25.verticalSpace,
                            CustomTextField(
                              controller: viewModel.currentPasswordCtrl,
                              label: 'Current Password',
                              hintText: 'Type here',
                              obscure: viewModel.obscureCurrentPassword,
                              suffixFunc:
                                  () =>
                                      viewModel.obscureCurrentPassword =
                                          !viewModel.obscureCurrentPassword,
                            ),
                            SizedBox(height: 30.h),
                            CustomButton(
                              onTap: () {
                                node.unfocus();
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  viewModel.changeEmail();
                                }
                              },
                              title: 'Submit',
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
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
