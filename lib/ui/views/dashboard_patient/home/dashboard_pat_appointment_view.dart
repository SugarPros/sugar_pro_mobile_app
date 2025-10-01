import 'package:sugar_pros/core/models/patient_dashboard_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/home/patient_home_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class DashboardPatAppointmentDetailView extends StackedView<PatientHomeViewModel> {
  const DashboardPatAppointmentDetailView({super.key, required this.app});

  final PatAppointments app;

  @override
  Widget builder(BuildContext context, PatientHomeViewModel viewModel, Widget? child) {
    log(app.insuranceCardFront ?? '');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                70.verticalSpace,
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 18.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => locator<NavigationService>().back(),
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: ShapeDecoration(
                            color: hexColor('#F1F5F9'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(color: hexColor('#E2E8F0'), width: 1),
                            ),
                          ),
                          child: SvgIcon('back'.svg),
                        ),
                      ),
                      Text(
                        'Appointment Details',
                        style: BrandTextStyles.semiBold.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20.w, height: 20.w),
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: ShapeDecoration(
                            color: Utils.getAppointmentStatusBgColor(app.status ?? ''),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                          ),
                          child: Text(
                            Utils.getAppointmentStatus(app.status ?? ''),
                            style: BrandTextStyles.medium.copyWith(
                              color: Utils.getAppointmentStatusTxtColor(app.status ?? ''),
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          '${DateFormatUtil.safeFormat(app.date ?? '', DateFormatUtil.dateFormat)} at ${DateFormatUtil.formatTime(app.time)}',
                          style: BrandTextStyles.semiBold.copyWith(
                            color: Colors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    if (app.status == '1') ...[
                      15.verticalSpace,
                      InkWell(
                        onTap: () => viewModel.joinMeeting(app.appointmentUid),
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: ShapeDecoration(
                            color: BrandColors.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgIcon('video'.svg, color: Colors.white),
                              5.horizontalSpace,
                              Text(
                                'Join',
                                style: BrandTextStyles.medium.copyWith(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    20.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoCard(
                          title: 'Patient Information',
                          items: [
                            InfoItem(label: 'Full Name', value: app.usersFullName),
                            InfoItem(label: 'Patient ID', value: app.patientId),
                            InfoItem(label: 'Email', value: app.usersEmail),
                            InfoItem(label: 'Address', value: app.usersAddress),
                            InfoItem(label: 'Contact', value: app.usersPhone),
                          ],
                        ),
                        15.verticalSpace,
                        InfoCard(
                          title: 'Provider Information',
                          items: [
                            InfoItem(
                              label: 'Provider',
                              value: '${app.fname ?? ''} ${app.lname ?? ''}',
                            ),
                            InfoItem(label: 'Appointmenyt ID', value: app.appointmentUid),
                          ],
                        ),
                        15.verticalSpace,
                        InfoCard(
                          title: 'Payment Information',
                          items: [
                            InfoItem(
                              label: 'Payment Status',
                              value: (app.paymentStatus ?? '').capitalizeAllFirst(),
                            ),
                            InfoItem(label: 'Amount', value: 'USD ${app.amount ?? ''}'),
                            InfoItem(label: 'Stripe Charge ID', value: app.stripeChargeId ?? ''),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: bottomPadding(context) + 20.h),
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
  PatientHomeViewModel viewModelBuilder(BuildContext context) =>
      PatientHomeViewModel();
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.title, required this.items});

  final String title;
  final List<InfoItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: ShapeDecoration(
        color: hexColor('#F3F4F6'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: BrandTextStyles.semiBold.copyWith(fontSize: 18.sp, color: Colors.black),
          ),
          10.verticalSpace,
          ...items.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: BrandTextStyles.medium.copyWith(
                      color: hexColor('#6A7282'),
                      fontSize: 14.r,
                    ),
                  ),
                  item.valueWidget ??
                      Text(
                        item.value ?? '',
                        style: BrandTextStyles.regular.copyWith(
                          color: Colors.black,
                          fontSize: 16.r,
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoItem {
  final String label;
  final String? value;
  final Widget? valueWidget;

  InfoItem({required this.label, this.value, this.valueWidget});
}
