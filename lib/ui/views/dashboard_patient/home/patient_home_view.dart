import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/dashboard_patient_viewmodel.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/home/patient_home_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/appointment_box.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<DashboardPatientViewModel>(
      builder:
          (context, parentModel) => ViewModelBuilder<PatientHomeViewModel>.reactive(
            viewModelBuilder: () => PatientHomeViewModel(),
            onViewModelReady: (viewModel) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                viewModel.fetchPatientChatHistory();
              });
            },
            builder:
                (context, viewModel, child) => AnnotatedRegion<SystemUiOverlayStyle>(
                  value: Utils.dark,
                  child: Scaffold(
                    backgroundColor: hexColor('#F3F4F6'),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopHeader(),
                        20.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  15.verticalSpace,
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
                                        type: 'Provider',
                                        patientname:
                                            '${appointment?.fname ?? ''} ${appointment?.lname ?? ''}',
                                        status: 'Started',
                                        patientId: appointment?.patientId ?? '',
                                        appointmentId: appointment?.appointmentUid ?? '',
                                        appountmentType:
                                            (appointment?.type ?? '')
                                                .toString()
                                                .capitalizeAllFirst(),
                                        date: DateFormatUtil.safeFormat(
                                          appointment?.date,
                                          DateFormatUtil.dateFormat,
                                        ),
                                        time: DateFormatUtil.formatTime(appointment?.time),
                                        onProfileView: () => {},
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
          ),
    );
  }
}

class TopHeader extends ViewModelWidget<PatientHomeViewModel> {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context, PatientHomeViewModel viewModel) {
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
                            text: viewModel.user?.patUser?.name ?? '',
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
