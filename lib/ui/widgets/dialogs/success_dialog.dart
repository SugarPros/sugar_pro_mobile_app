import 'package:sugar_pros/core/utils/exports.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.request, required this.completer});

  final DialogRequest request;
  final Function completer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexColor('#075143'),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: 126.h,
                  width: 150.w,
                  decoration: ShapeDecoration(
                    color: hexColor('#206256'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.r)),
                  ),
                ),
                SizedBox(height: 27.h),
                Text(
                  request.title ?? 'Successful',
                  textAlign: TextAlign.center,
                  style: BrandTextStyles.bold.copyWith(fontSize: 32.sp, color: BrandColors.secondary),
                ),
                SizedBox(height: 4.h),
                Text(
                  request.description ?? 'Thank you for choosing us',
                  textAlign: TextAlign.center,
                  style: BrandTextStyles.regular.copyWith(fontSize: 20.sp, color: BrandColors.secondary),
                ),
                SizedBox(height: 70.h),
              ],
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: CustomButton(
                    onTap: () => completer(DialogResponse(confirmed: true)),
                    backgroundColor: BrandColors.secondary,
                    textColor: hexColor('#041915'),
                    title: request.mainButtonTitle ?? 'Proceed',
                  ),
                ),
                if (request.secondaryButtonTitle == null)
                  const SizedBox.shrink()
                else
                  TextButton(
                    onPressed: () {
                      completer(DialogResponse(confirmed: false));
                    },
                    child: Text(
                      request.secondaryButtonTitle ?? '',
                      textAlign: TextAlign.center,
                      style: BrandTextStyles.semiBold.copyWith(
                        color: const Color(0xFF19853F),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                SizedBox(height: 20 + bottomPadding(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
