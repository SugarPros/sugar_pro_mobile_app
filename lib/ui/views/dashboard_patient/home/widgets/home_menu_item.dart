import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class HomeMenuItem extends StatelessWidget {
  const HomeMenuItem({super.key, required this.title, required this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: BrandTextStyles.medium.copyWith(
                    color: hexColor('#041915'),
                    fontSize: 16.sp,
                  ),
                ),
                SvgIcon('chevron-right'.svg),
              ],
            ),
            25.verticalSpace,
            Container(
              width: double.infinity,
              height: 93.h,
              decoration: ShapeDecoration(
                color: hexColor('#F1F5F9'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
