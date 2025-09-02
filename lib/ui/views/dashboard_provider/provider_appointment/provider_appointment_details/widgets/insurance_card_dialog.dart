import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/widgets/custom_network_image.dart';

class InsuranceDialog extends StatelessWidget {
  const InsuranceDialog({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: IntrinsicHeight(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 27.w),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Insurance Card',
                      textAlign: TextAlign.center,
                      style: BrandTextStyles.bold.copyWith(
                        color: const Color(0xFF000B09),
                        fontSize: 18.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.close, color: Colors.black, size: 25.h),
                    ),
                  ],
                ),
                20.verticalSpace,
                CustomNetworkImage(imageUrl: 'http://31.97.14.107:8080/$imageUrl', width: double.infinity, height: MediaQuery.of(context).size.height * 0.6)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
