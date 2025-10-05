import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/patient_settings_viewmodel.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_profile/provider_profile_view.dart';

class PatientSettingsView extends StackedView<PatientSettingsViewModel> {
  const PatientSettingsView({super.key});

  @override
  Widget builder(BuildContext context, PatientSettingsViewModel viewModel, Widget? child) {
    return Scaffold(
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
                        'Settings',
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
                    15.verticalSpace,
                    Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                      ),
                      child: Column(
                        children: [
                          ProfileMenu(
                            icon: 'profile',
                            title: 'Change Email',
                            onTap: viewModel.sendEmailOtp,
                          ),
                          Divider(color: hexColor('#E5E7EB')),
                          ProfileMenu(
                            icon: 'password',
                            title: 'Change Password',
                            onTap: viewModel.sendOtp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PatientSettingsViewModel viewModelBuilder(BuildContext context) => PatientSettingsViewModel();
}

class AccountMenu extends StatelessWidget {
  const AccountMenu({super.key, required this.onTap, required this.title});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: BrandTextStyles.regular.copyWith(fontSize: 16.sp, color: Colors.black),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 12.w, color: hexColor('#6A7282')),
          ],
        ),
      ),
    );
  }
}
