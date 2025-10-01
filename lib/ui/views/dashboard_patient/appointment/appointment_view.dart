import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/appointment_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PatientAppointmentView extends StackedView<AppointmentViewModel> {
  const PatientAppointmentView({super.key});

  @override
  void onViewModelReady(AppointmentViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget builder(BuildContext context, AppointmentViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: hexColor('#FFFFFF'),
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                70.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 40.w, width: 40.w),
                    Text(
                      'Appointments',
                      style: BrandTextStyles.semiBold.copyWith(
                        fontSize: 18.sp,
                        color: hexColor('#121212'),
                      ),
                    ),
                    InkWell(
                      onTap: viewModel.navigateToBookAppointment,
                      child: Image.asset('add-app'.png, height: 40.h)),
                  ],
                ),
                30.verticalSpace,
              ],
            ),
          ),
          15.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: CustomTextField(
              fillColor: Colors.white,
              border: false,
              borderColor: Colors.transparent,
              radius: 100.r,
              hintText: 'Search Something...',
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 10.w),
                child: SvgIcon('search'.svg),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: viewModel.appointments.length,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (ctx, _) => 15.verticalSpace,
                      itemBuilder: (ctx, i) {
                        final appointment = viewModel.appointments[i];
                        return PatientAppointmentBox(
                          name: appointment.usersFullName,
                          email: appointment.email,
                          phone: appointment.usersPhone,
                          date: DateFormatUtil.safeFormat(
                            appointment.date,
                            DateFormatUtil.dateFormat,
                          ),
                          time: DateFormatUtil.formatTime(appointment.time),
                          meetingLink: appointment.meetingUrl,
                          status: appointment.status,
                          onJoinMeeting: () => viewModel.joinMeeting(appointment.appointmentUid),
                          onViewDeails: () => viewModel.navigateToAppointmentDetails(appointment),
                        );
                      },
                    ),
                    50.verticalSpace,
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
  AppointmentViewModel viewModelBuilder(BuildContext context) => AppointmentViewModel();
}

class PatientAppointmentBox extends StatelessWidget {
  const PatientAppointmentBox({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.time,
    required this.date,
    required this.meetingLink,
    required this.status,
    required this.onViewDeails,
    required this.onJoinMeeting,
  });

  final String? name;
  final String? email;
  final String? phone;
  final String? time;
  final String? date;
  final String? meetingLink;
  final String? status;
  final VoidCallback onViewDeails;
  final VoidCallback onJoinMeeting;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      style: BrandTextStyles.bold.copyWith(
                        fontSize: 14.sp,
                        color: hexColor('#000000'),
                      ),
                    ),
                    Text(
                      'Provider',
                      style: BrandTextStyles.medium.copyWith(
                        fontSize: 14.sp,
                        color: hexColor('#64748B'),
                      ),
                    ),
                    5.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Icon(Icons.circle, color: hexColor('#2889AA'), size: 15.h),
                        ),
                        5.horizontalSpace,
                        Text(
                          '${time ?? ''} - ${date ?? ''}',
                          style: BrandTextStyles.regular.copyWith(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                      decoration: ShapeDecoration(
                        color: Utils.getAppointmentStatusBgColor(status ?? ''),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
                      ),
                      child: Text(
                        Utils.getAppointmentStatus(status ?? ''),
                        style: BrandTextStyles.medium.copyWith(
                          color: Utils.getAppointmentStatusTxtColor(status ?? ''),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    GestureDetector(
                      onTap: onViewDeails,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                        decoration: ShapeDecoration(
                          color: BrandColors.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
                        ),
                        child: Text(
                          'View Details',
                          style: BrandTextStyles.medium.copyWith(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.w),
            child: Row(
              children: [
                FittedBox(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 9.w),
                    decoration: ShapeDecoration(
                      color: hexColor('#F8FAFC'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        side: BorderSide(color: hexColor('#E2E8F0')),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgIcon('mail'.svg),
                        5.horizontalSpace,
                        Text(
                          email ?? '',
                          style: BrandTextStyles.regular.copyWith(
                            fontSize: 12.sp,
                            color: hexColor('#475569'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                10.horizontalSpace,
                FittedBox(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 9.w),
                    decoration: ShapeDecoration(
                      color: hexColor('#F8FAFC'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        side: BorderSide(color: hexColor('#E2E8F0')),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgIcon('call'.svg),
                        5.horizontalSpace,
                        Text(
                          phone ?? '',
                          style: BrandTextStyles.regular.copyWith(
                            fontSize: 12.sp,
                            color: hexColor('#475569'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (status == '1') ...[
            15.verticalSpace,
            InkWell(
              onTap: onJoinMeeting,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                margin: EdgeInsets.symmetric(horizontal: 11.w),
                decoration: ShapeDecoration(
                  color: hexColor('#DBEAFE'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Join Meeting',
                          style: BrandTextStyles.regular.copyWith(
                            fontSize: 10.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            meetingLink ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset('vid'.png, height: 40.h),
                  ],
                ),
              ),
            ),
          ],
          15.verticalSpace,
        ],
      ),
    );
  }
}
