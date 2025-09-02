import 'package:sugar_pros/core/utils/exports.dart';

class RecordBox extends StatelessWidget {
  const RecordBox({
    super.key,
    required this.patientname,
    required this.patientId,
    required this.dob,
    required this.age,
    required this.gender,
    required this.onViewDetail,
  });

  final String patientname;
  final String patientId;
  final String dob;
  final String age;
  final String gender;
  final VoidCallback onViewDetail;

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
                      patientId,
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
                          'DOB',
                          style: BrandTextStyles.medium.copyWith(
                            color: hexColor('#6A7282'),
                            fontSize: 12.r,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          dob,
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
                          'Age',
                          style: BrandTextStyles.medium.copyWith(
                            color: hexColor('#6A7282'),
                            fontSize: 12.r,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          age,
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
                          'Gender',
                          style: BrandTextStyles.medium.copyWith(
                            color: hexColor('#6A7282'),
                            fontSize: 12.r,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          gender,
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
                SizedBox(
                  height: 42.h,
                  child: CustomButton(
                    onTap: onViewDetail,
                    title: 'View Detail',
                    padding: EdgeInsets.zero,
                    radius: 7.r,
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