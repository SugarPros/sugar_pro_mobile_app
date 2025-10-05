// ignore_for_file: deprecated_member_use

import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_nutrition_tracker/patient_nutrition_sheet.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_nutrition_tracker/patient_nutrition_tracker_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientNutritionTrackerView extends StackedView<PatientNutritionTrackerViewModel> {
  const PatientNutritionTrackerView({super.key});

  @override
  void onViewModelReady(PatientNutritionTrackerViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.nutritionTracker();
    });
  }

  @override
  Widget builder(BuildContext context, PatientNutritionTrackerViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: CustomTextField(
                border: false,
                borderColor: hexColor('#D1D5DC'),
                radius: 100.r,
                hintText: 'Search Something...',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                  child: SvgIcon('search'.svg),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: viewModel.foods.length,
                        separatorBuilder: (ctx, i) => 15.verticalSpace,
                        itemBuilder: (ctx, i) {
                          final food = viewModel.foods[i];
                          return NutitionBoxList(
                            title: food.name ?? '',
                            kCal: food.calories ?? '',
                            cup: food.servingDescription ?? '',
                            protein: food.protein ?? '',
                            carbs: food.carbs ?? '',
                            fat: food.fat ?? '',
                            onTap: () {
                              bottomModalSetup(
                                context: context,
                                child: PatientNutritionSheet(food: food),
                              );
                            },
                            url: () {
                              launch(food.foodUrl ?? '');
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: bottomPadding(context) + 100.h),
                  Positioned(
                    bottom: 20.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      margin: EdgeInsets.symmetric(horizontal: 18.h),
                      decoration: ShapeDecoration(
                        color: hexColor('#2889AA'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(7.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Image',
                            style: BrandTextStyles.bold.copyWith(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                          5.horizontalSpace,
                          SvgIcon('upload'.svg),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  PatientNutritionTrackerViewModel viewModelBuilder(BuildContext context) => PatientNutritionTrackerViewModel();
}

class NutitionBoxList extends StatelessWidget {
  const NutitionBoxList({
    super.key,
    required this.title,
    required this.kCal,
    required this.cup,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.url,
    required this.onTap,
  });

  final String title;
  final String kCal;
  final String cup;
  final String protein;
  final String carbs;
  final String fat;
  final VoidCallback url;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16.r),
            side: BorderSide(color: hexColor('#E5E7EB')),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: BrandTextStyles.semiBold.copyWith(color: Colors.black, fontSize: 16.sp),
            ),
            5.verticalSpace,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: ShapeDecoration(
                    color: hexColor('#eab308').withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                  ),
                  child: Row(
                    children: [
                      Image.asset('protein'.png),
                      5.horizontalSpace,
                      Text(
                        '${protein}g',
                        style: BrandTextStyles.semiBold.copyWith(
                          color: hexColor('#b45309'),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                10.horizontalSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: ShapeDecoration(
                    color: hexColor('#003566').withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                  ),
                  child: Row(
                    children: [
                      Image.asset('carbs'.png),
                      5.horizontalSpace,
                      Text(
                        '${carbs}g',
                        style: BrandTextStyles.semiBold.copyWith(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                10.horizontalSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: ShapeDecoration(
                    color: hexColor('#F87171').withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                  ),
                  child: Row(
                    children: [
                      Image.asset('fat'.png),
                      5.horizontalSpace,
                      Text(
                        '${fat}g',
                        style: BrandTextStyles.semiBold.copyWith(
                          color: Colors.black,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            5.verticalSpace,
            Row(
              children: [
                Text(
                  kCal,
                  style: BrandTextStyles.bold.copyWith(color: Colors.black, fontSize: 16.sp),
                ),
                5.horizontalSpace,
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Text(
                    'kcal',
                    style: BrandTextStyles.regular.copyWith(
                      color: hexColor('#737373'),
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            5.verticalSpace,
            Text(
              cup,
              style: BrandTextStyles.regular.copyWith(color: Colors.black, fontSize: 12.sp),
            ),
            10.verticalSpace,
            GestureDetector(
              onTap: url,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: ShapeDecoration(
                  color: hexColor('#133A59'),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                ),
                child: Text(
                  'See Details',
                  style: BrandTextStyles.semiBold.copyWith(fontSize: 12.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
