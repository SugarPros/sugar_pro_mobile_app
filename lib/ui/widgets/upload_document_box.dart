import 'package:dotted_border/dotted_border.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class UploadDocumentBox extends StatelessWidget {
  const UploadDocumentBox({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(8.r),
      color: hexColor('#E6EBF0'),
      strokeWidth: 2,
      dashPattern: [5],
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: ShapeDecoration(
          color: hexColor('#F8FAFC'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 3.h), child: SvgIcon('upload'.svg)),
            5.horizontalSpace,
            Text(
              title ?? 'Click to upload',
              style: BrandTextStyles.regular.copyWith(fontSize: 14.sp, color: hexColor('#334155')),
            ),
          ],
        ),
      ),
    );
  }
}