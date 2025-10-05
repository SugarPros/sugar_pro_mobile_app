import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/notification/notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({super.key});

  @override
  Widget builder(BuildContext context, NotificationViewModel viewModel, Widget? child) {
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
                        'Notifications',
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                            itemCount: viewModel.notifications?.length ?? 0,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            separatorBuilder: (ctx, _) => 15.verticalSpace,
                            itemBuilder: (ctx, i) {
                              final notifiction = viewModel.notifications?[i];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notifiction?.notification ?? '',
                                    style: BrandTextStyles.semiBold.copyWith(
                                      color: hexColor('#374151'),
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Text(
                                    DateFormatUtil.notificationDateTime.format(dateText(notifiction?.createdAt)),
                                    style: BrandTextStyles.regular.copyWith(
                                      color: hexColor('#6b7280'),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 50.h + bottomPadding(context))
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
  NotificationViewModel viewModelBuilder(BuildContext context) => NotificationViewModel();
}
