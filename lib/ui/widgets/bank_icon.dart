import 'package:shimmer/shimmer.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class BankIcon extends StatelessWidget {
  const BankIcon({super.key, required this.bankName, this.size});

  final String? bankName;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.r),
      child: SizedBox(
        width: size ?? 20.w,
        height: size ?? 20.w,
        child: Center(
          child: SvgPicture.network(
            'https://nigerialogos.com/logos/${Utils.getLogoBankName(bankName ?? '')}/${Utils.getLogoBankName(bankName ?? '')}.svg',
            width: size ?? 20.w,
            height: size ?? 20.w,
            fit: BoxFit.fill,
            placeholderBuilder:
                (context) => Shimmer.fromColors(
                  baseColor: Colors.grey[350]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(width: 30.h, height: 30.h, color: Colors.white),
                ),
            errorBuilder:
                (context, _, __) => SvgPicture.asset(
                  'bank'.svg,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(Theme.of(context).svgColor, BlendMode.srcIn),
                ),
          ),
        ),
      ),
    );
  }
}