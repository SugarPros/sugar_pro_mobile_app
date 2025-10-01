import 'package:dotted_border/dotted_border.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/book_appointment_viewmodel.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/medicare_sheet.dart';
import 'package:sugar_pros/ui/widgets/custom_dropdown.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class Medicare extends StatelessWidget {
  const Medicare({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(label: 'First name', hintText: 'Type here'),
                          15.verticalSpace,
                          CustomTextField(label: 'Last name', hintText: 'Type here'),
                          15.verticalSpace,
                          CustomTextField(label: 'Email', hintText: 'Type here'),
                          15.verticalSpace,
                          CustomTextField(label: 'Phone number', hintText: 'Type here'),
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
                            controller: viewModel.dobCtrl,
                            initialDate: DateTime(
                              DateTime.now().year - 19,
                              DateTime.now().month,
                              DateTime.now().day,
                            ),
                            stopDate: DateTime(2053),
                            onDateSelected: (value) => viewModel.dob = value,
                            value:
                                viewModel.dob == null
                                    ? null
                                    : viewModel.dob!.toString().split(' ')[0],
                          ),
                          15.verticalSpace,
                          CustomDropdown(
                            label: 'Time',
                            hint: 'Select time',
                            value: viewModel.time,
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
                            onChanged: (val) => viewModel.time = val,
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Provide Insurance Company',
                            hintText: 'e 0., UnitedHealthcare, Blue Cross Blue Shield',
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Policyholder\'s Name (if different)',
                            hintText: 'Policyholder\'s Name',
                          ),
                          15.verticalSpace,
                          CustomTextField(label: 'Policy/ID Number', hintText: 'Policy/ID Number'),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Group Number (if applicable)',
                            hintText: 'Group Number',
                          ),
                          15.verticalSpace,
                          CustomDropdown(
                            label: 'Insurance Plan Type',
                            hint: 'Select Plan Type',
                            value: viewModel.insurancePlan,
                            items:
                                viewModel.insurencePlanList.map((String gender) {
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
                            onChanged: (val) => viewModel.insurancePlan = val,
                          ),
                          15.verticalSpace,
                          Text(
                            'Upload Insurance Card (Front)',
                            textAlign: TextAlign.center,
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          6.verticalSpace,
                          InkWell(
                            onTap: () {},
                            child: DottedBorder(
                              dashPattern: [4, 4],
                              color: hexColor('#DB353A'),
                              radius: Radius.circular(10.r),
                              borderType: BorderType.RRect,
                              child: Container(
                                padding: EdgeInsets.all(10.w),
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  color: hexColor('#F5F5F5'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset('upload1'.png, height: 50.h),
                                    10.verticalSpace,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Upload your picture here',
                                          textAlign: TextAlign.center,
                                          style: BrandTextStyles.medium.copyWith(
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Don’t worry—this is stored securely!',
                                          textAlign: TextAlign.center,
                                          style: BrandTextStyles.regular.copyWith(
                                            fontSize: 14.sp,
                                            color: hexColor('#616161'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'Upload Insurance Card (Back)',
                            textAlign: TextAlign.center,
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          6.verticalSpace,
                          InkWell(
                            onTap: () {},
                            child: DottedBorder(
                              dashPattern: [4, 4],
                              color: hexColor('#DB353A'),
                              radius: Radius.circular(10.r),
                              borderType: BorderType.RRect,
                              child: Container(
                                padding: EdgeInsets.all(10.w),
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  color: hexColor('#F5F5F5'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset('upload1'.png, height: 50.h),
                                    10.verticalSpace,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Upload your picture here',
                                          textAlign: TextAlign.center,
                                          style: BrandTextStyles.medium.copyWith(
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Don’t worry—this is stored securely!',
                                          textAlign: TextAlign.center,
                                          style: BrandTextStyles.regular.copyWith(
                                            fontSize: 14.sp,
                                            color: hexColor('#616161'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Prior Diagnoses (if applicable)',
                            maxLines: 3,
                            hintText: 'List any prior diagnoses',
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Current Medications (include dosages)',
                            maxLines: 3,
                            hintText: 'List medications and dosages',
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Allergies (drugs, environmental, etc.)',
                            maxLines: 3,
                            hintText: 'List allergies',
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Past Surgical History',
                            maxLines: 3,
                            hintText: 'List any past surgeries',
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Family Medical History (if relevant)',
                            hintText: 'Relevant family medical history',
                            maxLines: 3,
                          ),
                          60.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: CustomButton(
                    onTap: () {
                      bottomModalSetup(context: context, child: MedicareSheet());
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
