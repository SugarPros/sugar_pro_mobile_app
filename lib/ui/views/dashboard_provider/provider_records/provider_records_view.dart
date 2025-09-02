import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_records/provider_records_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/records_box.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class ProviderRecordsView extends StackedView<ProviderRecordsViewModel> {
  const ProviderRecordsView({super.key});

  @override
  Widget builder(BuildContext context, ProviderRecordsViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                70.verticalSpace,
                Text(
                  'Patient Records',
                  style: BrandTextStyles.semiBold.copyWith(fontSize: 18.sp, color: Colors.black),
                ),
                20.verticalSpace,
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    15.verticalSpace,
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
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.userDetails?.length ?? 0,
                      separatorBuilder: (ctx, i) => 15.verticalSpace,
                      itemBuilder: (ctx, i) {
                        final patient = viewModel.patients?[i];
                        final record = viewModel.userDetails?[i];
                        return RecordBox(
                          patientname: '${record?.fname ?? ''} ${record?.lname ?? ''}',
                          patientId: patient?.patientId ?? '',
                          dob: DateFormatUtil.safeFormat(record?.dob, DateFormatUtil.dateFormat),
                          age: '${DateFormatUtil.getAge(record?.dob)}',
                          gender: (record?.gender ?? '').capitalizeAllFirst(),
                          onViewDetail:
                              () => viewModel.navigateToProviderRecordDetail(patient, record),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProviderRecordsViewModel viewModelBuilder(BuildContext context) => ProviderRecordsViewModel();
}
