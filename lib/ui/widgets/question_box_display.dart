

import 'package:sugar_pros/core/utils/exports.dart';

class QuestionBoxDisplay extends StatelessWidget {
  final String? content;

  const QuestionBoxDisplay({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
          child: Text(
            'Security Question',
            style: BrandTextStyles.medium.copyWith(fontSize: 13.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
          child: Text(
            content ?? '',
            style: BrandTextStyles.medium.copyWith(fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
