import 'package:sugar_pros/core/models/patient_record_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_records/provider_records_detail/pd_records_detail_viewmodel.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_records/provider_records_detail/tabs/dexcom.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_records/provider_records_detail/tabs/nutrition_tracker.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PdRecordsDetailView extends StackedView<PdRecordsDetailViewModel> {
  const PdRecordsDetailView({super.key, required this.patient, required this.record});

  final PatientsList patient;
  final UserDetails record;

  @override
  Widget builder(BuildContext context, PdRecordsDetailViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                70.verticalSpace,
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 18.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => locator<NavigationService>().back(),
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: ShapeDecoration(
                            color: hexColor('#F1F5F9'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(color: hexColor('#E2E8F0'), width: 1),
                            ),
                          ),
                          child: SvgIcon('back'.svg),
                        ),
                      ),
                      Text(
                        record.fname ?? '',
                        style: BrandTextStyles.semiBold.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20.w, height: 20.w),
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    indicatorColor: hexColor('#2889AA'),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: hexColor('#2889AA'), width: 8.w),
                    ),
                    dividerColor: Colors.transparent,
                    labelStyle: BrandTextStyles.semiBold.copyWith(fontSize: 15.sp),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    unselectedLabelStyle: BrandTextStyles.regular.copyWith(
                      fontSize: 15.sp,
                      color: hexColor('#4A5565'),
                    ),
                    onTap: (value) => viewModel.setIndex(value),
                    tabs: [
                      Tab(text: 'Dexcom/Libre'),
                      Tab(text: 'Nutrition tracker'),
                      Tab(text: 'Virtual notes'),
                      Tab(text: 'Clinical notes'),
                      Tab(text: 'Quest Lab'),
                      Tab(text: 'E-Prescriptions'),
                    ],
                  ),
                  20.verticalSpace,
                  Expanded(
                    child: TabBarView(
                      children: [
                        Dexcom(),
                        NutitionTracker(),
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PdRecordsDetailViewModel viewModelBuilder(BuildContext context) => PdRecordsDetailViewModel();
}
