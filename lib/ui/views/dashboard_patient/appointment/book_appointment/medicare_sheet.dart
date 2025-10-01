import 'package:sugar_pros/core/utils/exports.dart';

class MedicareSheet extends StatelessWidget {
  const MedicareSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: hexColor('#e5e7eb'),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Center(
                  child: Text(
                    'For Medicare Patients',
                    style: BrandTextStyles.medium.copyWith(
                      fontSize: 24.sp,
                      color: hexColor('#133A59'),
                    ),
                  ),
                ),
              ),
              30.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: BorderSide(color: hexColor('#D1D5DC'), width: 1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'For Medicare Patients',
                          style: BrandTextStyles.semiBold.copyWith(
                            color: hexColor('#133A59'),
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          '\$50/m',
                          style: BrandTextStyles.medium.copyWith(
                            color: hexColor('#133A59'),
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Text(
                      '\$0 Out-of-Pocket for Core Services',
                      style: BrandTextStyles.regular.copyWith(
                        color: hexColor('#1E2939'),
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      'Your complete diabetes care covered by Medicare:',
                      style: BrandTextStyles.regular.copyWith(
                        color: hexColor('#4A5565'),
                        fontSize: 14.sp,
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      '• Monthly virtual visits with endocrinologists\n• Continuous glucose monitors (CGMs)\n• Full access to SugarPros AI\n• Annual comprehensive diabetes evaluation',
                      style: BrandTextStyles.regular.copyWith(
                        color: hexColor('#4A5565'),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              40.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: CustomButton(onTap: () {}, title: 'Continue to pay'),
              ),
              20.verticalSpace,
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
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
