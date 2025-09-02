import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class AppointmentBox extends StatelessWidget {
  const AppointmentBox({
    super.key,
    required this.patientname,
    required this.status,
    required this.patientId,
    required this.appointmentId,
    required this.appountmentType,
    required this.date,
    required this.time,
    required this.onProfileView,
    this.type,
  });

  final String patientname;
  final String status;
  final String patientId;
  final String appointmentId;
  final String appountmentType;
  final String date;
  final String time;
  final VoidCallback onProfileView;
  final String? type;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientname,
                      style: BrandTextStyles.semiBold.copyWith(color: Colors.black, fontSize: 16.r),
                    ),
                    4.verticalSpace,
                    Text(
                      type ?? 'Patient',
                      style: BrandTextStyles.semiBold.copyWith(
                        color: hexColor('#4A5565'),
                        fontSize: 14.r,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: ShapeDecoration(
                    color: hexColor('#DBEAFE'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                  ),
                  child: Text(
                    status,
                    style: BrandTextStyles.medium.copyWith(
                      color: hexColor('#1E40AF'),
                      fontSize: 12.sp,
                    ),
                  ),
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
                          appointmentId,
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
                          'Type',
                          style: BrandTextStyles.medium.copyWith(
                            color: hexColor('#6A7282'),
                            fontSize: 12.r,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          appountmentType,
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
                          onTap: onProfileView,
                          title: 'View Profile',
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
