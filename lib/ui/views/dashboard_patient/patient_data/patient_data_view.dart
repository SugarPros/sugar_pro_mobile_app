import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_data_viewmodel.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_dexcom/patient_dexcom_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_nutrition_tracker/patient_nutrition_tracker_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_quest_lab/patient_quest_lab_view.dart';

class PatientDataView extends StackedView<PatientDataViewModel> {
  const PatientDataView({super.key});

  @override
  void onViewModelReady(PatientDataViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.clinicalNotes();
      viewModel.questLab();
      viewModel.getEprescriptions();
    });
  }

  @override
  Widget builder(BuildContext context, PatientDataViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
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
                  child: Text(
                    'My Data',
                    style: BrandTextStyles.semiBold.copyWith(fontSize: 18.sp, color: Colors.black),
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    indicatorColor: hexColor('#2889AA'),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: hexColor('#2889AA'), width: 8.w),
                    ),
                    dividerColor: Colors.transparent,
                    labelStyle: BrandTextStyles.semiBold.copyWith(fontSize: 15.sp),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    unselectedLabelStyle: BrandTextStyles.regular.copyWith(
                      fontSize: 15.sp,
                      color: hexColor('#4A5565'),
                    ),
                    onTap: (value) => viewModel.setIndex(value),
                    tabs: [
                      Tab(text: 'Dexcom/Libre'),
                      Tab(text: 'Nutrition tracker'),
                      Tab(text: 'Clinical notes'),
                      Tab(text: 'Quest Lab'),
                      Tab(text: 'E-Prescriptions'),
                    ],
                  ),
                  // 20.verticalSpace,
                  Expanded(
                    child: TabBarView(
                      children: [
                        PatientDexcomView(),
                        PatientNutritionTrackerView(),
                        SizedBox(),
                        PatientQuestLabView(),
                        SizedBox(),
                      ],
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

  @override
  PatientDataViewModel viewModelBuilder(BuildContext context) => PatientDataViewModel();
}
