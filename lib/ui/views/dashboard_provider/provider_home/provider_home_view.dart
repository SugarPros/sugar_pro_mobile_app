import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/dashboard_patient_viewmodel.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_home/provider_home_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/appointment_box.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class ProviderHomeView extends StatelessWidget {
  const ProviderHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<DashboardPatientViewModel>(
      builder:
          (context, parentModel) => ViewModelBuilder<ProviderHomeViewModel>.reactive(
            viewModelBuilder: () => ProviderHomeViewModel(),
            onViewModelReady: (viewModel) {
              viewModel.setup();
            },
            builder:
                (context, viewModel, child) => Scaffold(
                  backgroundColor: hexColor('#F3F4F6'),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopHeader(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                15.verticalSpace,
                                Row(
                                  children: [
                                    TotalAppointments(
                                      total: '${viewModel.dashboard?.appointments?.length ?? 0}',
                                    ),
                                    ActiveApointments(
                                      active: '${viewModel.dashboard?.appointments?.length ?? 0}',
                                    ),
                                  ],
                                ),
                                20.verticalSpace,
                                CustomTextField(
                                  fillColor: Colors.white,
                                  border: false,
                                  borderColor: Colors.transparent,
                                  radius: 100.r,
                                  hintText: 'Search Something...',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: 15.w, right: 10.w),
                                    child: SvgIcon('search'.svg),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(8.w),
                                    child: Image.asset('filter2'.png, height: 40.h),
                                  ),
                                ),
                                20.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Active Appointments',
                                      style: BrandTextStyles.semiBold.copyWith(
                                        color: Colors.black,
                                        fontSize: 18.r,
                                      ),
                                    ),
                                    Text(
                                      'See all',
                                      style: BrandTextStyles.semiBold.copyWith(
                                        color: hexColor('#2889AA'),
                                        fontSize: 16.r,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                ListView.separated(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: viewModel.dashboard?.appointments?.length ?? 0,
                                  separatorBuilder: (ctx, i) => 15.verticalSpace,
                                  itemBuilder: (ctx, i) {
                                    final appointment = viewModel.dashboard?.appointments?[i];
                                    return AppointmentBox(
                                      patientname:
                                          '${appointment?.fname ?? ''} ${appointment?.lname ?? ''}',
                                      status: 'Started',
                                      patientId: appointment?.patientId ?? '',
                                      appointmentId: appointment?.appointmentUid ?? '',
                                      appountmentType:
                                          (appointment?.type ?? '').toString().capitalizeAllFirst(),
                                      date: DateFormatUtil.safeFormat(
                                        appointment?.date,
                                        DateFormatUtil.dateFormat,
                                      ),
                                      time: DateFormatUtil.formatTime(appointment?.time),
                                      onProfileView: () => viewModel.navigateToPdAppoitmentDetails(appointment),
                                    );
                                  },
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
    );
  }
}

class TopHeader extends ViewModelWidget<ProviderHomeViewModel> {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context, ProviderHomeViewModel viewModel) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          70.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('alfred'.png, height: 54.h),
                    5.horizontalSpace,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome,\n',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#6A7282'),
                            ),
                          ),
                          TextSpan(
                            text: viewModel.user?.authData?.provider?.firstName ?? '',
                            style: BrandTextStyles.semiBold.copyWith(
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Image.asset('notif'.png, height: 46.h),
              ],
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}

class TotalAppointments extends StatelessWidget {
  const TotalAppointments({super.key, required this.total});

  final String total;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            topLeft: Radius.circular(16.r),
          ),
          border: Border(right: BorderSide(color: hexColor('#E5E7EB'), width: 1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('appoint'.png, height: 40.h),
            15.verticalSpace,
            Text(
              'Total Appointments',
              style: BrandTextStyles.regular.copyWith(color: hexColor('#4A5565'), fontSize: 12.sp),
            ),
            Text(
              total,
              style: BrandTextStyles.semiBold.copyWith(color: Colors.black, fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveApointments extends StatelessWidget {
  const ActiveApointments({super.key, required this.active});

  final String active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          border: Border(right: BorderSide(color: hexColor('#E5E7EB'), width: 1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('active-appoint'.png, height: 40.h),
            15.verticalSpace,
            Text(
              'Active Appointments',
              style: BrandTextStyles.regular.copyWith(color: hexColor('#4A5565'), fontSize: 12.sp),
            ),
            Text(
              active,
              style: BrandTextStyles.semiBold.copyWith(color: Colors.black, fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
