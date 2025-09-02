import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.onTap, this.color, this.iconColor});

  final Function onTap;
  final Color? color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 32.w,
        width: 32.w,
        padding: EdgeInsets.all(8.w),
        decoration: ShapeDecoration(
          color: color ?? hexColor('#206256'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        child: SvgIcon('back'.svg, height: 20.h, color: iconColor ?? Colors.white,),
      ),
    );
  }
}
