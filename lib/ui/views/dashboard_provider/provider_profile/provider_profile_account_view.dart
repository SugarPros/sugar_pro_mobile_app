import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_profile/provider_profile_viewmodel.dart';

class ProviderProfileAccountView extends StackedView<ProviderProfileViewModel> {
  const ProviderProfileAccountView({super.key});

  @override
  Widget builder(BuildContext context, ProviderProfileViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
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
                        'Account',
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
                          AccountMenu(
                            title: 'Personal information',
                            onTap: viewModel.navigateToProfileAccountInfo,
                          ),
                          Divider(color: hexColor('#E5E7EB')),
                          AccountMenu(title: 'Preferences', onTap: () {}),
                          Divider(color: hexColor('#E5E7EB')),
                          AccountMenu(title: 'About Yourself', onTap: () {}),
                          5.verticalSpace,
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
  ProviderProfileViewModel viewModelBuilder(BuildContext context) => ProviderProfileViewModel();
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
