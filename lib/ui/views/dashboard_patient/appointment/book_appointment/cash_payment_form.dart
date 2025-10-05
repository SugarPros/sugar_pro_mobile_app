import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/book_appointment_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/custom_dropdown.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class CashPaymentForm extends StatelessWidget {
  const CashPaymentForm({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FocusNode node = FocusScope.of(context);
    return ReactivePartialBuild<BookAppointmentViewModel>(
      builder:
          (context, viewModel) => Scaffold(
            backgroundColor: Colors.white,
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
                              onTap: () => viewModel.jumpTo(0),
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
                              'Book an Appointment',
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              label: 'Full name',
                              hintText: 'Type here',
                              controller: viewModel.fullNameCtrl,
                            ),
                            15.verticalSpace,
                            CustomTextField(
                              label: 'Email',
                              hintText: 'Type here',
                              controller: viewModel.emailCtrl,
                            ),
                            15.verticalSpace,
                            CustomTextField(
                              label: 'Phone number',
                              hintText: 'Type here',
                              controller: viewModel.phoneCtrl,
                              inputType: TextInputType.phone,
                            ),
                            15.verticalSpace,
                            CustomTextField(
                              label: 'Address',
                              hintText: 'Type here',
                              maxLines: 2,
                              controller: viewModel.addressCtrl,
                            ),
                            15.verticalSpace,
                            CustomTextField(
                              label: 'Country Code',
                              hintText: 'Type here',
                              controller: viewModel.countryCodeCtrl,
                            ),
                            15.verticalSpace,
                            DatePickerfield(
                              label: 'Date',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgIcon(
                                  'date'.svg,
                                  color: hexColor('#848484'),
                                  width: 20.w,
                                  height: 20.w,
                                ),
                              ),
                              placeholder: 'MM/DD/YYYY',
                              controller: viewModel.dateCtrl,
                              initialDate: DateTime.now(),
                              startDate: DateTime.now(),
                              stopDate: DateTime(2053),
                              onDateSelected: (value) => viewModel.date = value,
                            ),
                            15.verticalSpace,
                            CustomDropdown(
                              label: 'Time',
                              hint: 'Select time',
                              value: viewModel.selectedTime,
                              items:
                                  viewModel.timeList.map((String gender) {
                                    return DropdownMenuItem<String>(
                                      value: gender,
                                      child: Text(
                                        gender,
                                        style: BrandTextStyles.semiBold.copyWith(
                                          fontSize: 14.sp,
                                          color: hexColor('#292D32'),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                              onChanged: (val) => viewModel.selectedTime = val,
                            ),
                            60.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: CustomButton(
                    onTap: () {
                      node.unfocus();
                      // if (formKey.currentState!.validate()) {
                      //   formKey.currentState!.save();
                      //   viewModel.initiatePayment();
                      // }
                      viewModel.jumpTo(3);
                    },
                    title: 'Save Changes',
                  ),
                ),
                SizedBox(height: 20 + bottomPadding(context)),
              ],
            ),
          ),
    );
  }
}
