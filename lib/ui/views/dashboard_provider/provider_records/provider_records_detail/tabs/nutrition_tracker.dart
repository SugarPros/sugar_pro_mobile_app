import 'package:fl_chart/fl_chart.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class NutitionTracker extends StatelessWidget {
  const NutitionTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        border: false,
                        borderColor: hexColor('#D1D5DC'),
                        radius: 100.r,
                        hintText: 'Search Something...',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15.w, right: 10.w),
                          child: SvgIcon('search'.svg),
                        ),
                      ),
                      20.verticalSpace,
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        separatorBuilder: (ctx, i) => 15.verticalSpace,
                        itemBuilder: (ctx, i) {
                          return NutitionBoxList(
                            title: 'Roasted Chicken Soup',
                            kCal: '1200',
                            dateTime: '19 July, 2025 - 2:35 AM',
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: bottomPadding(context) + 100.h),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 50.h,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            margin: EdgeInsets.symmetric(horizontal: 18.h),
            decoration: ShapeDecoration(
              color: hexColor('#2889AA'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(7.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload Image',
                  style: BrandTextStyles.bold.copyWith(color: Colors.white, fontSize: 16.sp),
                ),
                5.horizontalSpace,
                SvgIcon('upload'.svg),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NutitionBoxList extends StatelessWidget {
  const NutitionBoxList({
    super.key,
    required this.title,
    required this.kCal,
    required this.dateTime,
  });

  final String title;
  final String kCal;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          side: BorderSide(color: hexColor('#E5E7EB')),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('breakfast'.png, height: 75.h),
              15.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: BrandTextStyles.semiBold.copyWith(color: Colors.black, fontSize: 16.sp),
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      Text(
                        kCal,
                        style: BrandTextStyles.bold.copyWith(color: Colors.black, fontSize: 16.sp),
                      ),
                      5.horizontalSpace,
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Text(
                          'kcal',
                          style: BrandTextStyles.regular.copyWith(
                            color: hexColor('#737373'),
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Text(
                    dateTime,
                    style: BrandTextStyles.regular.copyWith(
                      color: hexColor('#4A5565'),
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GlucoseChart extends StatelessWidget {
  const GlucoseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Glucose Reading",
                  style: BrandTextStyles.medium.copyWith(
                    fontSize: 16.sp,
                    color: hexColor('#141414'),
                  ),
                ),
                Row(
                  children: const [
                    LegendItem(color: Colors.green, label: "Name here"),
                    SizedBox(width: 16),
                    LegendItem(color: Colors.red, label: "Name here"),
                  ],
                ),
              ],
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true, drawVerticalLine: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 3:
                                return const Text("3 hrs");
                              case 5:
                                return const Text("7 hrs");
                              case 7:
                                return const Text("8 hrs");
                              case 9:
                                return const Text("9 hrs");
                              case 11:
                                return const Text("10 hrs");
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                    lineBarsData: [
                      // Green line
                      LineChartBarData(
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 3,
                        spots: const [
                          FlSpot(3, 2.5),
                          FlSpot(6, 2.8),
                          FlSpot(8, 3.3),
                          FlSpot(9, 3.5),
                          FlSpot(10, 3.4),
                          FlSpot(11, 3.2),
                        ],
                      ),
                      // Red line
                      LineChartBarData(
                        isCurved: true,
                        color: Colors.red,
                        barWidth: 3,
                        spots: const [
                          FlSpot(3, 2.2),
                          FlSpot(6, 2.3),
                          FlSpot(8, 3.2),
                          FlSpot(9, 3.8),
                          FlSpot(10, 4.6),
                          FlSpot(11, 5.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 13.w,
          height: 13.w,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5.r)),
          ),
        ),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}

class ConnectionDetailsCard extends StatelessWidget {
  final String title;
  final String connectionName;
  final String status;
  final Color statusColor;
  final Map<String, String> details; // key = label, value = value

  const ConnectionDetailsCard({
    super.key,
    required this.title,
    required this.connectionName,
    required this.status,
    required this.statusColor,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: BrandTextStyles.medium.copyWith(color: hexColor('#141414'), fontSize: 20.sp),
          ),
          10.verticalSpace,
          // Connection Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                connectionName,
                style: BrandTextStyles.medium.copyWith(
                  color: Colors.black.withValues(alpha: 0.6),
                  fontSize: 14.sp,
                ),
              ),
              Text(
                status,
                style: BrandTextStyles.bold.copyWith(color: statusColor, fontSize: 16.sp),
              ),
            ],
          ),
          // Other details
          ...details.entries.map((entry) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry.key,
                  style: BrandTextStyles.medium.copyWith(
                    color: Colors.black.withValues(alpha: 0.6),
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  entry.value,
                  style: BrandTextStyles.medium.copyWith(color: Colors.black, fontSize: 16.sp),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
