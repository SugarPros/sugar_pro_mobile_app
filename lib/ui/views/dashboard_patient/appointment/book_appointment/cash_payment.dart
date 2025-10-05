import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/book_appointment_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class CashPayment extends StatelessWidget {
  const CashPayment({super.key});

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
                              onTap: () => viewModel.jumpTo(2),
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
                              'Pricing',
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
                            'We believe world-class diabetes care should be accessible and affordable. ',
                            style: BrandTextStyles.semiBold.copyWith(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          25.verticalSpace,
                          Container(
                            decoration: ShapeDecoration(
                              color: hexColor('#F3F4F6'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => viewModel.billingCycle = 'monthly',
                                    child: BillingOption(
                                      title: 'Monthly',
                                      isSelected: viewModel.billingCycle == 'monthly',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => viewModel.billingCycle = 'annually',
                                    child: BillingOption(
                                      title: 'Annually',
                                      isSelected: viewModel.billingCycle == 'annually',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          20.verticalSpace,
                          if (viewModel.billingCycle == 'monthly')
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => viewModel.selectPrice = 'basic',
                                  child: _PriceOptionMonthly(
                                    title: 'Basic',
                                    price: '\$99/m',
                                    features: [
                                      '1 visit/month',
                                      'Medication management',
                                      'Basic lab review',
                                    ],
                                    isSelected: viewModel.selectPrice == 'basic',
                                  ),
                                ),
                                15.verticalSpace,
                                InkWell(
                                  onTap: () => viewModel.selectPrice = 'premium',
                                  child: _PriceOptionMonthly(
                                    title: 'Premium',
                                    price: '\$149/m',
                                    features: [
                                      'Everything in Basic',
                                      'CGM data analysis',
                                      'Weight loss support',
                                      'Urgent care messaging',
                                    ],
                                    isSelected: viewModel.selectPrice == 'premium',
                                  ),
                                ),
                                15.verticalSpace,
                                InkWell(
                                  onTap: () => viewModel.selectPrice = 'vip',
                                  child: _PriceOptionMonthly(
                                    title: 'VIP',
                                    price: '\$199/m',
                                    features: [
                                      'Everything in Premium',
                                      'Unlimited provider messaging',
                                      'Advanced testing',
                                      'Dedicated care coordinator',
                                    ],
                                    isSelected: viewModel.selectPrice == 'vip',
                                  ),
                                ),
                              ],
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => viewModel.selectPrice = 'basic',
                                  child: _PriceOptionAnnually(
                                    title: 'Annual Basic',
                                    price: '\$1,089',
                                    features: [
                                      '1 visit/month',
                                      'Medication management',
                                      'Basic lab review',
                                    ],
                                    isSelected: viewModel.selectPrice == 'basic',
                                  ),
                                ),
                                15.verticalSpace,
                                InkWell(
                                  onTap: () => viewModel.selectPrice = 'premium',
                                  child: _PriceOptionAnnually(
                                    title: 'Annual Premium',
                                    price: '\$1,639',
                                    features: [
                                      'Everything in Basic',
                                      'CGM data analysis',
                                      'Weight loss support',
                                      'Urgent care messaging',
                                    ],
                                    isSelected: viewModel.selectPrice == 'premium',
                                  ),
                                ),
                                15.verticalSpace,
                                InkWell(
                                  onTap: () => viewModel.selectPrice = 'vip',
                                  child: _PriceOptionAnnually(
                                    title: 'Annual VIP',
                                    price: '\$2,189',
                                    features: [
                                      'Everything in Premium',
                                      'Unlimited provider messaging',
                                      'Advanced testing',
                                      'Dedicated care coordinator',
                                    ],
                                    isSelected: viewModel.selectPrice == 'vip',
                                  ),
                                ),
                              ],
                            ),
                          40.verticalSpace,
                          CustomButton(
                            onTap: () {
                              if (viewModel.hasSelectedPrice) {
                                viewModel.initiatePayment();
                              } else {
                                flusher('Please select a price option', color: Colors.red);
                              }
                            },
                            title: 'Continue to pay',
                          ),
                          15.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: Center(
                              child: Text(
                                'No hidden fees. No surprise bills. Just straightforward pricing that puts your health first.',
                                textAlign: TextAlign.center,
                                style: BrandTextStyles.regular.copyWith(
                                  color: hexColor('#4A5565'),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20 + bottomPadding(context)),
              ],
            ),
          ),
    );
  }
}

class BillingOption extends StatelessWidget {
  const BillingOption({super.key, required this.title, required this.isSelected});

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: ShapeDecoration(
        color: isSelected ? hexColor('#2889AA') : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
      ),
      child: Center(
        child: Text(
          title,
          style: BrandTextStyles.bold.copyWith(
            color: isSelected ? Colors.white : hexColor('#1E2939'),
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}

class _PriceOptionMonthly extends StatelessWidget {
  final String title;
  final String price;
  final bool isSelected;
  final List<String> features;

  const _PriceOptionMonthly({
    required this.title,
    required this.isSelected,
    required this.features,
    required this.price,
  });

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: BrandTextStyles.semiBold.copyWith(
                  color: hexColor('#133A59'),
                  fontSize: 18.sp,
                ),
              ),
              Text(
                price,
                style: BrandTextStyles.medium.copyWith(color: hexColor('#133A59'), fontSize: 20.sp),
              ),
            ],
          ),
          5.verticalSpace,
          Text(
            'Best For',
            style: BrandTextStyles.regular.copyWith(color: hexColor('#1E2939'), fontSize: 16.sp),
          ),
          Text(
            'Maintenance care',
            style: BrandTextStyles.regular.copyWith(color: hexColor('#4A5565'), fontSize: 14.sp),
          ),
          5.verticalSpace,
          ...features.map(
            (feature) => Text(
              '• $feature',
              style: BrandTextStyles.regular.copyWith(color: hexColor('#4A5565'), fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceOptionAnnually extends StatelessWidget {
  final String title;
  final String price;
  final bool isSelected;
  final List<String> features;

  const _PriceOptionAnnually({
    required this.title,
    required this.isSelected,
    required this.features,
    required this.price,
  });

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: BrandTextStyles.semiBold.copyWith(
                  color: hexColor('#133A59'),
                  fontSize: 18.sp,
                ),
              ),
              Text(
                price,
                style: BrandTextStyles.medium.copyWith(color: hexColor('#133A59'), fontSize: 20.sp),
              ),
            ],
          ),
          5.verticalSpace,
          Text(
            'Best For',
            style: BrandTextStyles.regular.copyWith(color: hexColor('#1E2939'), fontSize: 16.sp),
          ),
          Text(
            'Maintenance care',
            style: BrandTextStyles.regular.copyWith(color: hexColor('#4A5565'), fontSize: 14.sp),
          ),
          5.verticalSpace,
          ...features.map(
            (feature) => Text(
              '• $feature',
              style: BrandTextStyles.regular.copyWith(color: hexColor('#4A5565'), fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
