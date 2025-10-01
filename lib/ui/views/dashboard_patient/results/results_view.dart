import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/results/results_viewmodel.dart';

class PatientResultsView extends StackedView<ResultsViewModel> {
  const PatientResultsView({super.key});

  @override
  Widget builder(BuildContext context, ResultsViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'My Data',
                    style: BrandTextStyles.medium.copyWith(
                      fontSize: 18.sp,
                      color: hexColor('#121212'),
                    ),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: viewModel.navigateToDexcom,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                                ),
                                child: Center(child: Text('Dexcom/Libre Results'))
                              ),
                            ),
                          ),
                          20.horizontalSpace,
                          Expanded(
                            child: GestureDetector(
                              onTap: viewModel.navigateToNutritionTracker,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                                ),
                                child: Center(child: Text('Nutriion Trancker'))
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                              ),
                              child: Center(child: Text('Clinical Notes'))
                            ),
                          ),
                          20.horizontalSpace,
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                              ),
                              child: Center(child: Text('Quest Lab'))
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                              ),
                              child: Center(child: Text('E-Presciptions'))
                            ),
                          ),
                          20.horizontalSpace,
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              decoration: ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ResultsViewModel viewModelBuilder(BuildContext context) => ResultsViewModel();
}
