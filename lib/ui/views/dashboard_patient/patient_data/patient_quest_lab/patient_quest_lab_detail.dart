import 'package:sugar_pros/core/models/quest_lab_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_quest_lab/patient_quest_lab_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class QuestLabDetailView extends StackedView<PatientQuestLabViewModel> {
  const QuestLabDetailView({super.key, required this.app});

  final QuestLab app;

  @override
  Widget builder(BuildContext context, PatientQuestLabViewModel viewModel, Widget? child) {
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
                        'My Quest Lab',
                        style: BrandTextStyles.semiBold.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 40.w, height: 40.w),
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
                            InfoItem(label: 'Full Name', value: app.patientName ?? ''),
                            InfoItem(label: 'Patient ID', value: app.patientId),
                            InfoItem(label: 'Contact', value: app.patientPhoneNo),
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
                            InfoItem(label: 'Provider', value: app.noteByProviderId),
                            InfoItem(label: 'Urgency', value: app.urgency),
                          ],
                        ),
                        15.verticalSpace,
                        InfoCard(
                          title: 'Test Details',
                          items: [
                            InfoItem(label: 'Code', value: app.testCode ?? ''),
                            InfoItem(
                              label: 'Category',
                              value: app.category ?? '',
                            ),
                            InfoItem(label: 'Specimen', value: app.specimenType ?? ''),
                          ],
                        ),
                        15.verticalSpace,
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
  PatientQuestLabViewModel viewModelBuilder(BuildContext context) => PatientQuestLabViewModel();
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
