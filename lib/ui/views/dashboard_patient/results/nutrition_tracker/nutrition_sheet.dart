import 'package:sugar_pros/core/models/nutrition_tracker_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class NutritionSheet extends StatelessWidget {
  const NutritionSheet({super.key, required this.food});

  final Foods food;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700.h,
      color: hexColor('#e5e7eb'),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        food.name ?? '',
                        style: BrandTextStyles.semiBold.copyWith(
                          fontSize: 18.sp,
                          color: hexColor('#041915'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.cancel, color: BrandColors.bc001A54, size: 30.h),
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              const Divider(),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildTag(
                          'protein'.png,
                          'Protein: ${food.protein ?? ''}g',
                          '#eab308',
                          '#b45309',
                        ),
                        10.horizontalSpace,
                        _buildTag('carbs'.png, 'Carbs: ${food.carbs ?? ''}g', '#003566', '#000000'),
                        10.horizontalSpace,
                        _buildTag('fat'.png, 'Fat: ${food.fat ?? ''}g', '#F87171', '#000000'),
                      ],
                    ),
                    20.verticalSpace,
                    // Instead of ListView, just map to widgets
                    ...List.generate(food.servings?.length ?? 0, (i) {
                      final serving = food.servings?[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              serving?.servingDescription ?? '',
                              style: BrandTextStyles.semiBold.copyWith(
                                color: Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                            15.verticalSpace,
                            Wrap(
                              spacing: 15.w,
                              runSpacing: 10.h,
                              children: [
                                FactsBox(
                                  title: 'Calories',
                                  value: '${serving?.calories ?? ''} Kal',
                                ),
                                FactsBox(title: 'Protein', value: '${serving?.protein ?? ''}g'),
                                FactsBox(
                                  title: 'Carbohydrate',
                                  value: '${serving?.carbohydrate ?? ''}g',
                                ),
                                FactsBox(title: 'Fat', value: '${serving?.fat ?? ''}g'),
                                FactsBox(title: 'Fiber', value: '${serving?.fiber ?? ''}g'),
                                FactsBox(title: 'Sugar', value: '${serving?.sugar ?? ''}g'),
                                FactsBox(title: 'Sodium', value: '${serving?.sodium ?? ''}mg'),
                                FactsBox(
                                  title: 'Serving size',
                                  value: '${serving?.metricServingAmount}g',
                                ),
                              ],
                            ),
                            if (i < ((food.servings?.length ?? 0) - 1)) // divider except last
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: const Divider(),
                              ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String asset, String text, String bg, String fg) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: ShapeDecoration(
        color: hexColor(bg).withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      ),
      child: Row(
        children: [
          Image.asset(asset),
          4.horizontalSpace,
          Text(
            text,
            style: BrandTextStyles.semiBold.copyWith(color: hexColor(fg), fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

class FactsBox extends StatelessWidget {
  const FactsBox({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 10.h),
      decoration: ShapeDecoration(
        color: hexColor('#f9fafb'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: BrandTextStyles.medium.copyWith(fontSize: 14.sp, color: hexColor('#6b7280')),
          ),
          Text(value, style: BrandTextStyles.bold.copyWith(fontSize: 16.sp, color: Colors.black)),
        ],
      ),
    );
  }
}
