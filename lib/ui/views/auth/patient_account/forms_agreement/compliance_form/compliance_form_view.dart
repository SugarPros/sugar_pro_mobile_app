import 'package:dotted_border/dotted_border.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/compliance_form/compliance_form_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class ComplianceForm extends StatelessWidget {
  const ComplianceForm({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ComplianceFormViewModel>.reactive(
      viewModelBuilder: () => ComplianceFormViewModel(),
      builder:
          (context, viewModel, child) => Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 18.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => locator<NavigationService>().back(),
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: SvgIcon('back'.svg),
                        ),
                      ),
                      Text(
                        'Compliance Form',
                        style: BrandTextStyles.medium.copyWith(
                          fontSize: 18.sp,
                          color: hexColor('#121212'),
                        ),
                      ),
                      SizedBox(width: 20.w, height: 20.w),
                    ],
                  ),
                ),
                15.verticalSpace,
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            label: 'Patient Name',
                            controller: viewModel.patientNameCtrl,
                            enabled: false,
                          ),                          
                          25.verticalSpace,
                          Text(
                            'I hereby authorize (“Sugar Pros”) to use my image, video recording, audio recording, demographic information, medical information, and personal testimony in articles, films, videotapes, books, portfolios, presentations, marketing materials and similar documents for Sugar Pros’ marketing, promotion and advertising activities.  I hereby consent to the storage and sharing of my image, video, and personal testimony for Sugar Pros’ marketing, promotional, and advertising purposes. I understand this information will be, without limitation, released to the general public worldwide and/or posted online on the Internet.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'I understand that I have the right to revoke this Marketing Authorization, in writing, at any time by sending such written notification to Sugar Pros at [insert address] Attn: [insert appropriate internal department; e.g., Legal Department or Compliance Office], except to the extent that action has been taken in reliance upon my Authorization. I understand that since the disclosure of my medical information will be made to the public, it is possible, and even likely, that my medical information will be redisclosed and no longer protected by health care privacy laws. Sugar Pros will not condition my treatment on whether I provide authorization for the requested use or disclosure.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,

                          Text(
                            'I understand that I have the right to: inspect or copy the protected health information to be used or disclosed as permitted under applicable law; refuse to sign this Marketing Authorization; and receive a copy of this Marketing Authorization. ',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,

                          Text(
                            'This Marketing Authorization is valid for five (5) years from the date this Authorization is signed, or the period provided under applicable state law, whichever is earlier.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,

                          Text(
                            'I have read the above information and authorize Sugar Pros to use or disclose the identified information for the purposes described herein.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          Text(
                            'By signing your name below, you acknowledge that you have read and agree to the terms of this Authorization.',
                            style: BrandTextStyles.bold.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          20.verticalSpace,
                          Text(
                            'Patient Signature',
                            textAlign: TextAlign.center,
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
                                func: (val) => viewModel.uploadSignature(val),
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
                                    if (viewModel.signatureFile != null)
                                      Image.file(
                                        File(viewModel.signatureFile?.path ?? ''),
                                        width: double.infinity,
                                        height: 100.h,
                                        fit: BoxFit.cover,
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
                                                'Upload here',
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
                          DatePickerfield(
                            label: 'Patient date of birth',
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
                            controller: viewModel.repDobCtrl,
                            initialDate: DateTime(2000, 1, 1),
                            startDate: DateTime(1900),
                            stopDate: DateTime.now(),
                            onDateSelected: (value) => viewModel.repDob = value,
                          ),
                          20.verticalSpace,
                          Text(
                            'If you are the parent or personal representative of the Patient, by signing below, you acknowledge that you have read and agree to the terms of this Authorization.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          20.verticalSpace,
                          Text(
                            'Personal Representative’s Signature ',
                            textAlign: TextAlign.center,
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
                                func: (val) => viewModel.uploadRepSignature(val),
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
                                    if (viewModel.repSignatureFile != null)
                                      Image.file(
                                        File(viewModel.repSignatureFile?.path ?? ''),
                                        width: double.infinity,
                                        height: 100.h,
                                        fit: BoxFit.cover,
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
                                                'Upload here',
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
                          DatePickerfield(
                            label: 'Personal Representative’s Signature date of birth',
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
                            controller: viewModel.repDobCtrl,
                            initialDate: DateTime(2000, 1, 1),
                            startDate: DateTime(1900),
                            stopDate: DateTime.now(),
                            onDateSelected: (value) => viewModel.repDob = value,
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Nature with patient',
                            controller: viewModel.natureWithPatientCtrl,
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),

                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            viewModel.navigateToPatentForm();
                          },
                          title: 'I Accept',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10 + bottomPadding(context)),
              ],
            ),
          ),
    );
  }
}
