import 'package:dotted_border/dotted_border.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/profile_patient_account/patient_profile_account_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/custom_dropdown.dart';
import 'package:sugar_pros/ui/widgets/custom_network_image.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PatientProfileAccountView extends StackedView<PatientProfileAccountViewModel> {
  const PatientProfileAccountView({super.key});

  @override
  void onViewModelReady(PatientProfileAccountViewModel viewModel) {
    viewModel.setup();
  }

  @override
  Widget builder(BuildContext context, PatientProfileAccountViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                70.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => locator<NavigationService>().back(),
                        child: Image.asset('back'.png, height: 46.h),
                      ),
                      Text(
                        'Account',
                        style: BrandTextStyles.semiBold.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 46.w, width: 46.w),
                    ],
                  ),
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
                    Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(label: 'First name', controller: viewModel.firstNameCtrl),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Middle name',
                            controller: viewModel.middleNameCtrl,
                          ),
                          15.verticalSpace,
                          CustomTextField(label: 'Last name', controller: viewModel.lastNameCtrl),
                          15.verticalSpace,
                          CustomTextField(label: 'Phone number', controller: viewModel.phoneCtrl),
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
                            label: 'Gender',
                            hint: 'Select Gender',
                            value: viewModel.selectedGender,
                            items:
                                viewModel.genderList.entries.map((entry) {
                                  return DropdownMenuItem<String>(
                                    value: entry.value,
                                    child: Text(entry.key),
                                  );
                                }).toList(),
                            onChanged: (val) => viewModel.selectedGender = val,
                          ),
                          15.verticalSpace,
                          Text(
                            'Just in case, who\'s your emergency contact?',
                            style: BrandTextStyles.bold.copyWith(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: 'Name',
                                  controller: viewModel.emergencyNameCtrl,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: CustomTextField(
                                  label: 'Relationship',
                                  controller: viewModel.emergencyRelationshipCtrl,
                                ),
                              ),
                            ],
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Phone number',
                            controller: viewModel.emergencyPhoneCtrl,
                          ),
                          15.verticalSpace,
                          Text(
                            'What’s your current address?',
                            style: BrandTextStyles.bold.copyWith(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: 'Street',
                                  controller: viewModel.streetCtrl,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: CustomTextField(
                                  label: 'City',
                                  controller: viewModel.cityCtrl,
                                ),
                              ),
                            ],
                          ),
                          15.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: 'State',
                                  controller: viewModel.stateCtrl,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: CustomTextField(
                                  label: 'Zip Code',
                                  controller: viewModel.zipCodeCtrl,
                                ),
                              ),
                            ],
                          ),
                          15.verticalSpace,
                          Text(
                            'For billing, do you have insurance? If so, we’ll need',
                            style: BrandTextStyles.bold.copyWith(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  label: 'Insurance Provider',
                                  controller: viewModel.insuranceProviderCtrl,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: CustomTextField(
                                  label: 'Plan Number',
                                  controller: viewModel.planNumberCtrl,
                                ),
                              ),
                            ],
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Group Number (If Applicable)',
                            controller: viewModel.groupNumberCtrl,
                          ),
                          15.verticalSpace,
                          Text(
                            'To verify your identity, could you snap a photo of your driver’s license or state ID?',
                            textAlign: TextAlign.left,
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          6.verticalSpace,
                          InkWell(
                            onTap: () {
                              selectImageFileSource(
                                context: context,
                                func: (val) => viewModel.uploadLicense(val),
                              );
                            },
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
                                    if (viewModel.license != null)
                                      Image.file(
                                        File(viewModel.license?.path ?? ''),
                                        width: double.infinity,
                                        height: 100.h,
                                        fit: BoxFit.cover,
                                      )
                                    else if (viewModel.licensePic != null)
                                      SizedBox(
                                        width: double.infinity,
                                        height: 100.h,
                                        child: CustomNetworkImage(
                                          imageUrl: viewModel.licensePic?.asImageUrl,
                                          width: double.infinity,
                                          height: 100.h,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    else
                                      Column(
                                        children: [
                                          Image.asset('upload1'.png, height: 50.h),
                                          10.verticalSpace,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Upload your license here',
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'Lastly, we might need your Social Security Number for insurance claims. Is that okay?',
                            style: BrandTextStyles.bold.copyWith(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          10.verticalSpace,
                          CustomTextField(label: 'SSN', controller: viewModel.ssnCtrl),
                          15.verticalSpace,
                          Text(
                            'Almost done! How would you like us to communicate with you?',
                            style: BrandTextStyles.bold.copyWith(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          10.verticalSpace,
                          CustomDropdown(
                            label: 'Communication Type',
                            hint: 'Select means of communcation',
                            value: viewModel.selectedNotification,
                            items:
                                viewModel.notificationList.entries.map((entry) {
                                  return DropdownMenuItem<String>(
                                    value: entry.value,
                                    child: Text(entry.key),
                                  );
                                }).toList(),
                            onChanged: (val) => viewModel.selectedNotification = val,
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    CustomButton(
                      onTap: () {
                        viewModel.updatePatientInfo();
                      },
                      title: 'Save Changes',
                    ),
                    SizedBox(height: 50 + bottomPadding(context)),
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
  PatientProfileAccountViewModel viewModelBuilder(BuildContext context) =>
      PatientProfileAccountViewModel();
}

class AccountMenu extends StatelessWidget {
  const AccountMenu({super.key, required this.onTap, required this.title});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: BrandTextStyles.regular.copyWith(fontSize: 16.sp, color: Colors.black),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 12.w, color: hexColor('#6A7282')),
          ],
        ),
      ),
    );
  }
}
