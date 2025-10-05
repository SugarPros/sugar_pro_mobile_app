import 'package:dotted_border/dotted_border.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/patient_agreement_form/patent_agrrement_form_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PatientAgreementFormView extends StatelessWidget {
  const PatientAgreementFormView({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PatientAgreementFormViewModel>.reactive(
      viewModelBuilder: () => PatientAgreementFormViewModel(),
      builder:
          (context, viewModel, child) => Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 18.w),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: SvgIcon('back'.svg),
                        ),
                      ),
                      5.horizontalSpace,
                      Text(
                        'Patient Financial Responsibility Agreement',
                        style: BrandTextStyles.medium.copyWith(
                          fontSize: 18.sp,
                          color: hexColor('#121212'),
                        ),
                      ),
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
                          Text(
                            '[SugarPros] and affiliated medical groups (collectively, [SugarPros]) and its affiliated medical group(s) (collectively, “Group”) are committed to providing the best quality medical services (the “Services”). This Patient Financial Responsibility Agreement (“Agreement”) outlines yourfinancial responsibility in relation to receipt of the Services from Group accepts certain insurance plans, including commercial payors and Medicare, etc. Please let Group know if you have medical insurance that you plan to use for payment of the Services. Group also offers a self-pay option for the Services. Please see the “Self-Payment of Services” section below for information on self-pay options INSURANCE. As a courtesy to its patients, Group is pleased to assist in the submission of medical insurance claims to insurance companies for payment.To the extent you have insurance that is accepted by Group, you understand and acknowledge that:\n\nYour medical insurance policy, if any, is a contract between you and your insurance company. It is your responsibility to know your benefits, and how they will apply to payment for the Services.\n\nIt is your responsibility to confirm that the provider that you see at Group is a participating provider under your medical insurance policy.\n\nYour insurance company, including Medicare, may not cover 100% of the costs and fees associated with the Services, and you will be responsible for payment of any remainingbalance due for the Services, including without limitation, for paying co-payments, deductibles, and any other costs and fees associated with the Services you receive that are not fully (or at all) covered by your insurance company. It is your responsibility to provide Group with appropriate and current medical insurance information, and to notify Group immediately upon any change in your medical insurance coverage to ensure efficient claims billing and payment. In the event that you fail to provide all necessary and current medical insurance information, you understand that your insurance company may deny payment of claims relating to the Services, and you understand that you may be 100% responsible for the costs and fees associated with the Services.\n\nIt is your responsibility to have obtained any and all necessary referrals and authorizations required prior to receiving the Services from Group. If your insurance company requires a referral and you do not have one, then you understand that you will be responsible for all the costs and fees associated with the Services you receive.\n\nIf your medical insurance requires a co-pay, the co-pay is required at the time the Service is rendered. To the extent you have insurance, you further hereby authorize payment of all medical insurance benefits which are payable to you under the terms of your medical insurance policy to be paid directly to Group for the Services rendered. SELF-PAYMENT OF SERVICES. Services provided by Group that are not covered by medical insurance or that you request not be submitted to your medical insurance are 100% self-pay by our patients. If you notify Group that you wish to purchase the Services on a self-pay basis either because you do not have medical insurance, or because you have medical insurance but you request that Group not submit bills to such medical insurance, you agree to be 100% responsible for full payment of the Services as set forth in the Fee Schedule. You understand and acknowledge that if you do not have medical insurance, or you communicate a preference to self-pay without using medical insurance, you will be responsible for 100% of the payment for your services.\n\n* * * * * *\n\nBy clicking “I agree” below, I certify that I have read this Patient Financial Responsibility Agreement, and I understand and agree to its terms. I hereby further represent that I am the patient, the patient’s legal representative, or am otherwise duly authorized by the patient to execute this Patient Financial Responsibility Agreement and accept its terms on the patient’s behalf.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          20.verticalSpace,
                          CustomTextField(
                            label: 'Username',
                            hintText: 'Enter your username',
                            controller: viewModel.usernameCtrl,
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
                            label: 'Signature date',
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
                            controller: viewModel.signDate,
                            initialDate: DateTime.now(),
                            startDate: DateTime.now(),
                            stopDate: DateTime(2053),
                            onDateSelected: (value) => viewModel.dob = value,
                          ),
                          15.verticalSpace,
                          CustomTextField(
                            label: 'Relationship with patient',
                            controller: viewModel.relationshipCtrl,
                          ),
                          15.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => viewModel.toggleAggrement(),
                                child: Container(
                                  width: 19.w,
                                  height: 19.w,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r),
                                      side: BorderSide(color: hexColor('#4E4E50')),
                                    ),
                                  ),
                                  child:
                                      viewModel.isAgree
                                          ? Center(
                                            child: Icon(
                                              Icons.check,
                                              color: BrandColors.primary,
                                              size: 15.h,
                                            ),
                                          )
                                          : const SizedBox.shrink(),
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I agree',
                                        style: BrandTextStyles.regular.copyWith(
                                          fontSize: 14.sp,
                                          color: hexColor('#4E4E50'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                            viewModel.navigateToSelfPaymentForm();
                          },
                          title: 'Next',
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
