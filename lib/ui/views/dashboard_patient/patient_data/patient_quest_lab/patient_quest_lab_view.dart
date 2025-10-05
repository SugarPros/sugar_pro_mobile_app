import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_quest_lab/patient_quest_lab_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PatientQuestLabView extends StackedView<PatientQuestLabViewModel> {
  const PatientQuestLabView({super.key});

  @override
  Widget builder(BuildContext context, PatientQuestLabViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              ListView.separated(
                itemCount: viewModel.questLab.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (ctx, _) => 15.verticalSpace,
                itemBuilder: (ctx, i) {
                  final quest = viewModel.questLab[i];
                  return QuestLabBox(
                    testname: quest.testName ?? '',
                    patientId: quest.patientId ?? '',
                    providerId: quest.noteByProviderId ?? '',
                    amount: '\$${quest.estimatedCost}',
                    date: DateFormatUtil.safeFormat(quest.date, DateFormatUtil.dateFormat),
                    time: DateFormatUtil.formatTime(quest.time),
                    onDetailsView: () => viewModel.navigateToLabDetail(quest),
                  );
                },
              ),
              SizedBox(height: bottomPadding(context) + 20.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  PatientQuestLabViewModel viewModelBuilder(BuildContext context) => PatientQuestLabViewModel();
}

class QuestLabBox extends StatelessWidget {
  const QuestLabBox({
    super.key,
    required this.testname,
    required this.patientId,
    required this.providerId,
    required this.amount,
    required this.date,
    required this.time,
    required this.onDetailsView,
  });

  final String testname;
  final String patientId;
  final String providerId;
  final String amount;
  final String date;
  final String time;
  final VoidCallback onDetailsView;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(left: 20.w, top: 20.h, right: 20.w),
            child: Row(
              children: [
                Image.asset('quest'.png, height: 40.h),
                5.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testname,
                      style: BrandTextStyles.semiBold.copyWith(color: Colors.black, fontSize: 16.r),
                    ),
                    4.verticalSpace,
                    Text(
                      'Patient',
                      style: BrandTextStyles.semiBold.copyWith(
                        color: hexColor('#4A5565'),
                        fontSize: 14.r,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Divider(color: hexColor('#E5E7EB')),
          10.verticalSpace,
          Padding(
            padding: EdgeInsetsGeometry.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Patient ID',
                          style: BrandTextStyles.medium.copyWith(
                            color: hexColor('#6A7282'),
                            fontSize: 12.r,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          patientId,
                          style: BrandTextStyles.regular.copyWith(
                            color: Colors.black,
                            fontSize: 14.r,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Appointment UID',
                          style: BrandTextStyles.medium.copyWith(
                            color: hexColor('#6A7282'),
                            fontSize: 12.r,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          providerId,
                          style: BrandTextStyles.regular.copyWith(
                            color: Colors.black,
                            fontSize: 14.r,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount',
                          style: BrandTextStyles.medium.copyWith(
                            color: hexColor('#6A7282'),
                            fontSize: 12.r,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          amount,
                          style: BrandTextStyles.regular.copyWith(
                            color: Colors.black,
                            fontSize: 14.r,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                15.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                  decoration: ShapeDecoration(
                    color: hexColor('#F3F4F6'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgIcon('date'.svg),
                          2.horizontalSpace,
                          Text(
                            date,
                            style: BrandTextStyles.regular.copyWith(
                              color: Colors.black,
                              fontSize: 14.r,
                            ),
                          ),
                          10.horizontalSpace,
                          SvgIcon('clock'.svg),
                          2.horizontalSpace,
                          Text(
                            time,
                            style: BrandTextStyles.regular.copyWith(
                              color: Colors.black,
                              fontSize: 14.r,
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      SizedBox(
                        height: 42.h,
                        child: CustomButton(
                          onTap: onDetailsView,
                          title: 'View Details',
                          padding: EdgeInsets.zero,
                          radius: 7.r,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
