import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_appointment/provider_appointment_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/appointment_box.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class ProviderAppointmentView extends StackedView<ProviderAppointmentViewModel> {
  const ProviderAppointmentView({super.key});

  @override
  Widget builder(BuildContext context, ProviderAppointmentViewModel viewModel, Widget? child) {
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
                  'Patient Appointments',
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
                      itemCount: viewModel.proAppointments?.length ?? 0,
                      separatorBuilder: (ctx, i) => 15.verticalSpace,
                      itemBuilder: (ctx, i) {
                        final app = viewModel.proAppointments?[i];
                        return AppointmentBox(
                          patientname: '${app?.fname ?? ''} ${app?.lname ?? ''}',
                          status: 'Started',
                          patientId: app?.patientId ?? '',
                          appointmentId: app?.appointmentUid ?? '',
                          appountmentType: (app?.type ?? '').capitalizeAllFirst(),
                          date: DateFormatUtil.safeFormat(app?.date, DateFormatUtil.dateFormat),
                          time: DateFormatUtil.formatTime(app?.time),
                          onProfileView: () =>  viewModel.navigateToAppointmentDetails(app)
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
  ProviderAppointmentViewModel viewModelBuilder(BuildContext context) => ProviderAppointmentViewModel();
}
