import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_profile/provider_profile_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class ProviderProfileView extends StackedView<ProviderProfileViewModel> {
  const ProviderProfileView({super.key});

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
                Text(
                  'Settings',
                  style: BrandTextStyles.semiBold.copyWith(fontSize: 18.sp, color: Colors.black),
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
                      padding: EdgeInsets.all(10.w),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                      ),
                      child: Row(
                        children: [
                          Image.asset('anime'.png, height: 70.h),
                          10.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AlfredOS',
                                  style: BrandTextStyles.semiBold.copyWith(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'help@smartsolutions.com',
                                  style: BrandTextStyles.regular.copyWith(
                                    fontSize: 14.sp,
                                    color: hexColor('#4A5565'),
                                  ),
                                ),
                                Text(
                                  '(555) 753-9514',
                                  style: BrandTextStyles.regular.copyWith(
                                    fontSize: 14.sp,
                                    color: hexColor('#4A5565'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset('edit'.png, height: 42.h),
                        ],
                      ),
                    ),
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
                            title: 'Account',
                            onTap: viewModel.navigateToProfileAccount,
                          ),
                          Divider(color: hexColor('#E5E7EB')),
                          ProfileMenu(icon: 'settings', title: 'Settings', onTap: () {}),
                          Divider(color: hexColor('#E5E7EB')),
                          ProfileMenu(icon: 'notification', title: 'Notification', onTap: () {}),
                          5.verticalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            margin: EdgeInsets.symmetric(horizontal: 17.w),
            decoration: ShapeDecoration(
              color: hexColor('#FF6467'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon('logout'.svg),
                10.horizontalSpace,
                Text(
                  'Logout',
                  style: BrandTextStyles.bold.copyWith(fontSize: 16.sp, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: bottomPadding(context) + 30.h),
        ],
      ),
    );
  }

  @override
  ProviderProfileViewModel viewModelBuilder(BuildContext context) => ProviderProfileViewModel();
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key, required this.icon, required this.onTap, required this.title});

  final String title;
  final VoidCallback onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Row(
          children: [
            SvgIcon(icon.svg, color: Colors.black),
            10.horizontalSpace,
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
