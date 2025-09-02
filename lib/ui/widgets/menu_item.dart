// ignore_for_file: deprecated_member_use

import 'package:sugar_pros/core/utils/exports.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            SvgPicture.asset(icon.svg, color: Theme.of(context).iconColor, height: 20.w,),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                style: BrandTextStyles.regular
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w300, color: context.isDarkMode ? Colors.white : const Color(0xFF292D32)),
              ),
            ),
            SvgPicture.asset(
              'ios-right'.svg,
              colorFilter:
                  ColorFilter.mode(Theme.of(context).svgColor, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}