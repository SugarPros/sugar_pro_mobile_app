import 'package:cached_network_image/cached_network_image.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.imageUrl,
    this.errorImage,
  });

  final double? height;
  final double? width;
  final String? imageUrl;
  final double? borderRadius;
  final Widget? errorImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl ?? 'https://fakeimg.pl/600x400',
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.grey, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[350]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      errorWidget: (context, url, error) =>
          CircleAvatar(
            backgroundColor: BrandColors.primary,
            radius: 40.r,
            child: errorImage ??
            Icon(
              Icons.person,
              size: 30.h,
              color: Colors.white,
            ),
          ),
    );
  }
}
