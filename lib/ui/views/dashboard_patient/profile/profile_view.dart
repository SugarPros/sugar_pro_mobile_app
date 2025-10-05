import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/profile_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/custom_network_image.dart';
import 'package:sugar_pros/ui/widgets/dialogs/confirm_dialog.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PatientProfileView extends StackedView<ProfileViewModel> {
  const PatientProfileView({super.key});

  @override
  void onViewModelReady(ProfileViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget builder(BuildContext context, ProfileViewModel viewModel, Widget? child) {
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
                  'Profile',
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: CustomNetworkImage(
                              imageUrl: viewModel.patAccountDetails?.profilePicture.asImageUrl,
                              width: 70.w,
                              height: 70.w,
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viewModel.patient?.patUser?.name ?? '',
                                  style: BrandTextStyles.semiBold.copyWith(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  viewModel.patient?.patUser?.email ?? '',
                                  style: BrandTextStyles.regular.copyWith(
                                    fontSize: 14.sp,
                                    color: hexColor('#4A5565'),
                                  ),
                                ),
                                Text(
                                  viewModel.patient?.patUser?.mobile ?? '',
                                  style: BrandTextStyles.regular.copyWith(
                                    fontSize: 14.sp,
                                    color: hexColor('#4A5565'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              selectImageFileSource(
                                context: context,
                                func: (val) => viewModel.uploadImage(val),
                              );
                            },
                            child: Image.asset('edit'.png, height: 42.h),
                          ),
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
                            onTap: viewModel.navigateToAccount,
                          ),
                          Divider(color: hexColor('#E5E7EB')),
                          ProfileMenu(
                            icon: 'settings',
                            title: 'Settings',
                            onTap: viewModel.navigateToSettings,
                          ),
                          Divider(color: hexColor('#E5E7EB')),
                          ProfileMenu(
                            icon: 'notification',
                            title: 'Notification',
                            onTap: viewModel.navigateToNotifications,
                          ),
                          Divider(color: hexColor('#E5E7EB')),
                          ProfileMenu(
                            icon: 'delete',
                            color: Colors.red,
                            title: 'Delete Account',
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ConfimDialog(
                                    onComplete: viewModel.deleteAccount,
                                    title: 'Delete Account?',
                                    textButton: 'Yes',
                                  );
                                },
                              );
                            },
                          ),
                          5.verticalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: viewModel.logout,
            child: Container(
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
          ),
          SizedBox(height: bottomPadding(context) + 30.h),
        ],
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.icon,
    this.color,
    required this.onTap,
    required this.title,
  });

  final String title;
  final VoidCallback onTap;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Row(
          children: [
            SvgIcon(icon.svg, color: color ?? Colors.black),
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
