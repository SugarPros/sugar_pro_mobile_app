import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/appointment_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PatientAppointmentView extends StackedView<AppointmentViewModel> {
  const PatientAppointmentView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AppointmentViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => log(''),
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: SvgIcon('back'.svg),
                    ),
                  ),
                  Text(
                    'Appointments',
                    style: BrandTextStyles.medium.copyWith(
                      fontSize: 18.sp,
                      color: hexColor('#121212'),
                    ),
                  ),
                  SizedBox(width: 20.w, height: 20.w),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 11.w,
                                vertical: 12.h,
                              ),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(color: hexColor('#E2E8F0')),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgIcon('filter'.svg, color: Colors.black),
                                  10.horizontalSpace,
                                  Text(
                                    'Filter',
                                    style: BrandTextStyles.medium.copyWith(
                                      fontSize: 14.sp,
                                      color: hexColor('#000000'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              FittedBox(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 11.w,
                                    vertical: 12.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.r),
                                      bottomLeft: Radius.circular(12.r),
                                    ),
                                    border: Border(
                                      bottom: BorderSide(
                                        color: hexColor('#E2E8F0'),
                                      ),
                                      top: BorderSide(
                                        color: hexColor('#E2E8F0'),
                                      ),
                                      left: BorderSide(
                                        color: hexColor('#E2E8F0'),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          SvgIcon(
                                            'date'.svg,
                                            color: Colors.black,
                                          ),
                                          10.horizontalSpace,
                                          Text(
                                            'Oct 18 - Nov 18',
                                            style: BrandTextStyles.medium
                                                .copyWith(
                                                  fontSize: 14.sp,
                                                  color: hexColor('#000000'),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FittedBox(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 11.w,
                                    vertical: 12.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12.r),
                                      bottomRight: Radius.circular(12.r),
                                    ),
                                    border: Border(
                                      bottom: BorderSide(
                                        color: hexColor('#E2E8F0'),
                                      ),
                                      top: BorderSide(
                                        color: hexColor('#E2E8F0'),
                                      ),
                                      left: BorderSide(
                                        color: hexColor('#E2E8F0'),
                                      ),
                                      right: BorderSide(
                                        color: hexColor('#E2E8F0'),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Monthly',
                                            style: BrandTextStyles.medium
                                                .copyWith(
                                                  fontSize: 14.sp,
                                                  color: hexColor('#000000'),
                                                ),
                                          ),
                                          5.horizontalSpace,
                                          SvgIcon(
                                            'arrow-down'.svg,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: 3,
                        separatorBuilder: (ctx, i) => 10.verticalSpace,
                        itemBuilder: (ctx, i) {
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 11.w,
                              vertical: 12.h,
                            ),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(color: hexColor('#E2E8F0')),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: BrandTextStyles.medium
                                              .copyWith(
                                                fontSize: 14.sp,
                                                color: hexColor('#64748B'),
                                              ),
                                        ),
                                        10.horizontalSpace,
                                        Text(
                                          'Smith William',
                                          style: BrandTextStyles.bold.copyWith(
                                            fontSize: 14.sp,
                                            color: hexColor('#000000'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 3.h),
                                          child: Icon(
                                            Icons.circle,
                                            color: hexColor('#2889AA'),
                                            size: 15.h,
                                          ),
                                        ),
                                        5.horizontalSpace,
                                        Text(
                                          '08:00 PM - 24 May 2024',
                                          style: BrandTextStyles.regular
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                20.verticalSpace,
                                FittedBox(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 7.h,
                                      horizontal: 9.w,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: hexColor('#F8FAFC'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          100.r,
                                        ),
                                        side: BorderSide(
                                          color: hexColor('#E2E8F0'),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgIcon('mail'.svg),
                                        5.horizontalSpace,
                                        Text(
                                          'username089@gmail.com',
                                          style: BrandTextStyles.regular
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color: hexColor('#475569'),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                15.verticalSpace,
                                FittedBox(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 7.h,
                                      horizontal: 9.w,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: hexColor('#F8FAFC'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          100.r,
                                        ),
                                        side: BorderSide(
                                          color: hexColor('#E2E8F0'),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgIcon('call'.svg),
                                        5.horizontalSpace,
                                        Text(
                                          '+92 3360444299',
                                          style: BrandTextStyles.regular
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color: hexColor('#475569'),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                20.verticalSpace,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                    horizontal: 20.w,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: hexColor('#DBEAFE'),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        100.r,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '55 Water Street New York City,\nwhile 111 West 57th Street',
                                          style: BrandTextStyles.medium
                                              .copyWith(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                              ),
                                        ),
                                      ),
                                      Image.asset('loc'.png, height: 40.h),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
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
  AppointmentViewModel viewModelBuilder(BuildContext context) =>
      AppointmentViewModel();
}
