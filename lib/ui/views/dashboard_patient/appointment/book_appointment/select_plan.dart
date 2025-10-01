import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/book_appointment_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class SelectPlan extends StatelessWidget {
  const SelectPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<BookAppointmentViewModel>(
      builder:
          (context, viewModel) => Scaffold(
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
                              'Select Plan',
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
                          Text(
                            'How would you like to pay?',
                            style: BrandTextStyles.bold.copyWith(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          15.verticalSpace,
                          InkWell(
                            onTap: () => viewModel.selectedPlan = 'medicare',
                            child: _PlanOption(
                              title: 'Medicare',
                              subtitle: 'Pay with your Medicare Insurence',
                              isSelected: viewModel.selectedPlan == 'medicare',
                            ),
                          ),
                          15.verticalSpace,
                          InkWell(
                            onTap: () => viewModel.selectedPlan = 'cash-payment',
                            child: _PlanOption(
                              title: 'Cash Payment',
                              subtitle: 'Pay with your credit card',
                              isSelected: viewModel.selectedPlan == 'cash-payment',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: CustomButton(
                    onTap: () {
                      if (viewModel.hasSelectedPlan) {
                        if (viewModel.selectedPlan == 'medicare') {
                          viewModel.jumpTo(1);
                        } else {
                          viewModel.jumpTo(2);
                        }
                      } else {
                        flusher('Please select a payment plan', color: Colors.red);
                      }
                    },
                    title: 'Continue',
                  ),
                ),
                SizedBox(height: 20 + bottomPadding(context)),
              ],
            ),
          ),
    );
  }
}

class _PlanOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;

  const _PlanOption({required this.title, required this.subtitle, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(color: isSelected ? hexColor('#2889AA') : hexColor('#D1D5DC'), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Texts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: BrandTextStyles.bold.copyWith(color: hexColor('#133A59'), fontSize: 18.sp),
              ),
              Text(
                subtitle,
                style: BrandTextStyles.regular.copyWith(
                  color: hexColor('#1E2939'),
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          // Circle Icon
          isSelected
              ? Image.asset('circle-selected'.png, height: 25.h)
              : Image.asset('circle'.png, height: 25.h),
        ],
      ),
    );
  }
}
