import 'package:sugar_pros/core/utils/exports.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final ColorFilter? colorFilter;
  final String? semanticsLabel;
  final BoxFit? fit;

  const SvgIcon(this.assetName, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.colorFilter,
    this.semanticsLabel,
    this.fit
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn)),
      width: width,
      height: height,
      semanticsLabel: semanticsLabel,
      fit: fit??BoxFit.contain,
    );
  }
}
