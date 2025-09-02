import 'package:sugar_pros/core/utils/exports.dart';

class ActivateWalletSheet extends StatelessWidget {
  const ActivateWalletSheet({super.key, required this.onProceed});

  final Function onProceed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 220.h,
            padding: EdgeInsets.only(top: 40.h),
            decoration: ShapeDecoration(
              color: hexColor('#E6EEEC'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
            ),
            child: Image.asset('wallet'.png, fit: BoxFit.fitHeight),
          ),
          16.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                children: [
                  Text(
                    'sugar_pros Wallet Activation',
                    style: BrandTextStyles.semiBold.copyWith(color: hexColor('#041915'), fontSize: 24.sp),
                  ),
                  Expanded(child: SizedBox(),),
                  CustomButton(onTap: () => onProceed(), title: 'Proceed',),
                  SizedBox(height: bottomPadding(context))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
