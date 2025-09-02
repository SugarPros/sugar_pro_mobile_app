import 'package:sugar_pros/core/utils/exports.dart';

class BeneficiaryItem extends StatelessWidget {
  final String text1;
  final String text2;
  final String? text3;

  const BeneficiaryItem({super.key, required this.text1, required this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              text1,
              style: BrandTextStyles.semiBold.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          SizedBox(
            width: 85.w,
            child: Text(
              text2,
              style: BrandTextStyles.medium.copyWith(fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 15.w),
          if (text3 == null)
            SizedBox()
          else
            SizedBox(
              width: 100.w,
              child: Text(
                text3!,
                style: BrandTextStyles.medium.copyWith(fontSize: 12.sp),
              ),
            ),
        ],
      ),
    );
  }
}
