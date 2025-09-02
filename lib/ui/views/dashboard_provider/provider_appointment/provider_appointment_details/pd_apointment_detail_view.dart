import 'package:sugar_pros/core/models/pro_appointments_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_appointment/provider_appointment_details/pd_appointment_detail_viewmodel.dart'
    show PdAppointmentDetailViewModel;
import 'package:sugar_pros/ui/views/dashboard_provider/provider_appointment/provider_appointment_details/widgets/insurance_card_dialog.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PdAppointmentDetailView extends StackedView<PdAppointmentDetailViewModel> {
  const PdAppointmentDetailView({super.key, required this.app});

  final ProAppointments app;

  @override
  Widget builder(BuildContext context, PdAppointmentDetailViewModel viewModel, Widget? child) {
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
                          padding: EdgeInsets.all(8.w),
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
                    20.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoCard(
                          title: 'Patient Information',
                          items: [
                            InfoItem(
                              label: 'Full Name',
                              value: '${app.fname ?? ''} ${app.lname ?? ''}',
                            ),
                            InfoItem(label: 'Patient ID', value: app.patientId),
                            InfoItem(label: 'Email', value: app.email),
                            InfoItem(label: 'Address', value: app.usersAddress),
                            InfoItem(label: 'Contact', value: app.usersPhone),
                          ],
                        ),
                        15.verticalSpace,
                        InfoCard(
                          title: 'Appointment Details',
                          items: [
                            InfoItem(label: 'Appointment UID', value: app.appointmentUid ?? ''),
                            InfoItem(
                              label: 'Date & Time',
                              value:
                                  '${DateFormatUtil.safeFormat(app.date, DateFormatUtil.dateFormat)} ${DateFormatUtil.formatTime(app.time)}',
                            ),
                            InfoItem(label: 'Chief Complaint', value: app.chiefComplaint),
                            InfoItem(label: 'Symptom Onset', value: app.symptomOnset),
                          ],
                        ),
                        15.verticalSpace,
                        InfoCard(
                          title: 'Medical History',
                          items: [
                            InfoItem(label: 'Prior Diagnoses', value: app.priorDiagnoses ?? ''),
                            InfoItem(
                              label: 'Current Medications',
                              value: app.currentMedications ?? '',
                            ),
                            InfoItem(label: 'Allergies', value: app.allergies ?? ''),
                            InfoItem(
                              label: 'Past Surgical History',
                              value: app.pastSurgicalHistory ?? '',
                            ),
                            InfoItem(
                              label: 'Family Medical History',
                              value: app.familyMedicalHistory ?? '',
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        InfoCard(
                          title: 'Insurance Information',
                          items: [
                            InfoItem(label: 'Insurance Company', value: app.insuranceCompany ?? ''),
                            InfoItem(label: 'Policyholder Name', value: app.policyholderName ?? ''),
                            InfoItem(label: 'Policy ID', value: app.policyId ?? ''),
                            InfoItem(label: 'Group Number', value: app.groupNumber ?? ''),
                            InfoItem(
                              label: 'Insurance Plan Type',
                              value: app.insurancePlanType ?? '',
                            ),
                            InfoItem(
                              label: 'Insurance Cards',
                              valueWidget: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder:
                                            (context) =>
                                                InsuranceDialog(imageUrl: app.insuranceCardFront),
                                      );
                                    },
                                    child: Text(
                                      'View Front',
                                      style: BrandTextStyles.medium.copyWith(
                                        color: hexColor('#2563EB'),
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  15.horizontalSpace,
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder:
                                            (context) =>
                                                InsuranceDialog(imageUrl: app.insuranceCardBack),
                                      );
                                    },
                                    child: Text(
                                      'View Back',
                                      style: BrandTextStyles.medium.copyWith(
                                        color: hexColor('#2563EB'),
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        InfoCard(
                          title: 'Payment Information',
                          items: [
                            InfoItem(label: 'Payment Status', value: (app.paymentStatus ?? '').capitalizeAllFirst()),
                            InfoItem(
                              label: 'Amount',
                              value: 'USD ${app.amount ?? ''}'
                            ),
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
  PdAppointmentDetailViewModel viewModelBuilder(BuildContext context) =>
      PdAppointmentDetailViewModel();
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
