import 'package:fl_chart/fl_chart.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class Dexcom extends StatelessWidget {
  const Dexcom({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 44.w),
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16.r)),
            ),
            child: Column(
              children: [
                Container(
                  width: 233.w,
                  height: 219.h,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.13),
                        offset: Offset(0, 3.88),
                        blurRadius: 46.54,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.76.r),
                      topRight: Radius.circular(175.63.r),
                      bottomLeft: Radius.circular(175.63.r),
                      bottomRight: Radius.circular(175.63.r),
                    ),
                  ),
                  child: Container(
                    width: 183.w,
                    height: 183.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.07),
                          offset: Offset(0, 3.88),
                          blurRadius: 46.54,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '6.1',
                          style: BrandTextStyles.bold.copyWith(
                            color: Colors.black,
                            fontSize: 45.sp,
                          ),
                        ),
                        Text(
                          'mmol/L',
                          style: BrandTextStyles.regular.copyWith(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                25.verticalSpace,
                Text(
                  'Manage Your Glucose Reading',
                  style: BrandTextStyles.medium.copyWith(
                    color: hexColor('#141414'),
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          15.verticalSpace,
          GlucoseChart(),
          15.verticalSpace,
          ConnectionDetailsCard(
            title: "Connections",
            connectionName: "Dexcom",
            status: "Connected",
            statusColor: Colors.red,
            details: {
              "Last sync": "April 25, 2025",
              "Time": "10:42 AM",
              "Battery Level": "Low",
              "Sensor Start Date": "April 25, 2025",
              "Sensor End Date": "April 25, 2025",
            },
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'History',
                      style: BrandTextStyles.semiBold.copyWith(
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      'See all',
                      style: BrandTextStyles.semiBold.copyWith(
                        color: hexColor('#2889AA'),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                CustomTextField(
                  fillColor: Colors.white,
                  border: false,
                  borderColor: Colors.transparent,
                  radius: 100.r,
                  hintText: 'Search Something...',
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 10.w),
                    child: SvgIcon('search'.svg),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Image.asset('filter2'.png, height: 40.h),
                  ),
                ),
                20.verticalSpace,
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (ctx, i) => 15.verticalSpace,
                  itemBuilder: (ctx, i) {
                    return HistoryList(
                      patientName: 'Willian John',
                      status: 'Rising',
                      startDate: '02 July, 2024',
                      endDate: '02 July, 2024',
                      glucoseLevel: '110 mg',
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: bottomPadding(context) + 20.h),
        ],
      ),
    );
  }
}

class HistoryList extends StatelessWidget {
  const HistoryList({
    super.key,
    required this.patientName,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.glucoseLevel,
  });

  final String patientName;
  final String status;
  final String startDate;
  final String endDate;
  final String glucoseLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName,
                      style: BrandTextStyles.semiBold.copyWith(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      'Patient',
                      style: BrandTextStyles.regular.copyWith(
                        color: hexColor('#4A5565'),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 6.w),
                  decoration: ShapeDecoration(
                    color: hexColor('#FFECEC'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4.r)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgIcon('rising'.svg),
                      2.horizontalSpace,
                      Text(
                        status,
                        style: BrandTextStyles.medium.copyWith(
                          color: hexColor('#E7000B'),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: hexColor('#E5E7EB')),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start Date',
                      style: BrandTextStyles.medium.copyWith(
                        color: hexColor('#6A7282'),
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      startDate,
                      style: BrandTextStyles.regular.copyWith(color: Colors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'End Date',
                      style: BrandTextStyles.medium.copyWith(
                        color: hexColor('#6A7282'),
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      endDate,
                      style: BrandTextStyles.regular.copyWith(color: Colors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Glucose Level',
                      style: BrandTextStyles.medium.copyWith(
                        color: hexColor('#6A7282'),
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      glucoseLevel,
                      style: BrandTextStyles.regular.copyWith(color: Colors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
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
