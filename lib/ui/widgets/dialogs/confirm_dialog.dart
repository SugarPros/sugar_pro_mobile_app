import 'package:sugar_pros/core/utils/exports.dart';

class ConfimDialog extends StatelessWidget {
  const ConfimDialog({
    super.key,
    required this.onComplete,
    required this.title,
    required this.textButton,
  });

  final Function onComplete;
  final String title;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: IntrinsicHeight(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 27.w),
            width: 330.w,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24.r)),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: BrandTextStyles.bold.copyWith(
                      color: const Color(0xFF000B09), fontSize: 18.sp),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        width: 130.w,
                        child: CustomButton(
                          onTap: () => onComplete(),
                          title: textButton,
                          padding: EdgeInsets.symmetric(horizontal: 25.h),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        width: 100.w,
                        child: CustomButton(
                          onTap: () => Navigator.of(context).pop(),
                          title: 'No',
                          filled: false,
                          textColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
