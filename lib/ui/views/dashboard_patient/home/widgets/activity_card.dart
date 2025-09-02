import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/home/patient_home_viewmodel.dart';

class ActivityCard extends ViewModelWidget<PatientHomeViewModel> {
  const ActivityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, PatientHomeViewModel viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Activity',
                style: BrandTextStyles.semiBold.copyWith(
                  color: hexColor('#041915'),
                  fontSize: 18.sp,
                ),
              ),
              Text(
                'View all',
                style: BrandTextStyles.medium.copyWith(
                  color: hexColor('#075143'),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: ShapeDecoration(
                  color: hexColor('#F1F5F9'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                ),
              ),
              5.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Curated a procurement cart',
                      style: BrandTextStyles.medium.copyWith(
                        fontSize: 16.sp,
                        color: hexColor('#334155'),
                      ),
                    ),
                    Text(
                      'You curated a procurement on sugar_pros AI',
                      style: BrandTextStyles.regular.copyWith(
                        fontSize: 14.sp,
                        color: hexColor('#64748B'),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Icon(
                            Icons.circle,
                            color: hexColor('#0F172A'),
                            size: 8.h,
                          ),
                        ),
                        2.horizontalSpace,
                        Text(
                          'Yesterday',
                          style: BrandTextStyles.regular.copyWith(
                            fontSize: 12.sp,
                            color: hexColor('#0F172A'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.h),
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
                decoration: ShapeDecoration(
                  color: hexColor('#041915'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                child: Text(
                  'Checkout',
                  style: BrandTextStyles.medium.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Divider(color: hexColor('#F1F5F9')),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: ShapeDecoration(
                  color: hexColor('#F1F5F9'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                ),
              ),
              5.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RMB Purchase',
                      style: BrandTextStyles.medium.copyWith(
                        fontSize: 16.sp,
                        color: hexColor('#334155'),
                      ),
                    ),
                    Text(
                      'You bought RMB worth  ₦220,000.00',
                      style: BrandTextStyles.regular.copyWith(
                        fontSize: 14.sp,
                        color: hexColor('#64748B'),
                        fontFamilyFallback: ['Inter']
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Icon(
                            Icons.circle,
                            color: hexColor('#0F172A'),
                            size: 8.h,
                          ),
                        ),
                        2.horizontalSpace,
                        Text(
                          'Yesterday',
                          style: BrandTextStyles.regular.copyWith(
                            fontSize: 12.sp,
                            color: hexColor('#0F172A'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Text(
                  '¥350',
                  style: BrandTextStyles.bold.copyWith(
                    color: hexColor('#EF4444'),
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}