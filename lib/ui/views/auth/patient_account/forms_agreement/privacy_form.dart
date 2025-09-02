import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/forms_agreement_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PrivacyForm extends StatelessWidget {
  const PrivacyForm({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BasePartialBuild<FormsAgreementViewModel>(
      builder:
          (context, viewModel) => Scaffold(
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
                        onTap: () => log('ddd'),
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: SvgIcon('back'.svg),
                        ),
                      ),
                      Text(
                        'Privacy Form and Consent Form',
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
                          Text(
                            'This Notice of Privacy Practices (the “Notice”) describes how [SugarPros] (“we” or “our”) may use and disclose your protected health information to carry out treatment, payment, or business operations and for other purposes that are permitted or required by law. “Protected health information” or “PHI” is information about you, including demographic information, that may identify you and that relates to your past, present or future physical health or condition, treatment, or payment for health care services. This Notice also describes your rights to access and control your protected health information.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'USES AND DISCLOSURES OF PROTECTED HEALTH INFORMATION:',
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 19.sp,
                              color: hexColor('#121212'),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            'Your protected health information may be used and disclosed by our health care providers, our staff, and others outside of our office that are involved in your care and treatment for the purpose of providing health care services to you, to support our business operations, to obtain payment for your care, and any other use authorized or required by law.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'TREATMENT:',
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 19.sp,
                              color: hexColor('#121212'),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            'We will use and disclose your protected health information to provide, coordinate, or manage your health care and any related services. This includes the coordination or management of your health care with a third party. For example, your protected health information may be provided to a health care provider to whom you have been referred to ensure the necessary information is accessible to diagnose or treat you.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'PAYMENT:',
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 19.sp,
                              color: hexColor('#121212'),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            'Your protected health information may be used to bill or obtain payment for your health care services. This may include certain activities that your health insurance plan may undertake before it approves or pays for your services, such as making a determination of eligibility or coverage for insurance benefits and reviewing services provided to you for medical necessity.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'HEALTH CARE OPERATIONS:',
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 19.sp,
                              color: hexColor('#121212'),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            'We may use or disclose, as needed, your protected health information in order to support the business activities of our organization. These activities include, but are not limited to, improving quality of care, providing information about treatment alternatives or other health-related benefits and services, developing, or maintaining and supporting computer systems, legal services, and conducting audits and compliance programs, including fraud, waste, and abuse investigations.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'USES AND DISCLOSURES THAT DO NOT REQUIRE YOUR AUTHORIZATION:',
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 19.sp,
                              color: hexColor('#121212'),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            'We may use or disclose your protected health information in the following situations without your authorization. These situations include the following uses and disclosures: as required by law; for public health purposes; for health care oversight purposes; for abuse or neglect reporting; pursuant to Food and Drug Administration requirements; in connection with legal proceedings; for law enforcement purposes; to coroners, funeral directors and organ donation agencies; for certain research purposes; for allegations of certain criminal activities; for certain military activity and national security purposes; for workers’ compensation reporting; relating to certain inmate reporting; and other required uses and disclosures. Under the law, we must make certain disclosures to you upon your request, and when required by the Secretary of the Department of Health and Human Services to investigate or determine our compliance with the requirements of the Health Insurance Portability and Accountability Act (“HIPAA”). State laws may further restrict these disclosures.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'USES AND DISCLOSURES THAT REQUIRE YOUR AUTHORIZATION:',
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 19.sp,
                              color: hexColor('#121212'),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            'Other permitted and required uses and disclosures will be made only with your consent, authorization or opportunity to object unless permitted or required by law. Without your authorization, we are expressly prohibited from using or disclosing your protected health information for marketing purposes. We may not sell your protected health information without your authorization. Your protected health information will not be used for fundraising. We will not use or disclose your psychotherapy notes without your authorization, except as permitted by law. If you provide us with an authorization for certain uses and disclosures of your information, you may revoke such authorization, at any time, in writing, except to the extent that we have taken an action in reliance on the use or disclosure indicated in the authorization.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'YOUR RIGHTS WITH RESPECT TO YOUR PROTECTED HEALTH INFORMATION:',
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 19.sp,
                              color: hexColor('#121212'),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            '1. You have the right to request a restriction on the use or disclosure of your protected health information. Your request must be in writing and state the specific restriction requested and to whom you want the restriction to apply. We are not required to agree to a restriction that you may request, except if the requested restriction is on a disclosure to a health plan for a payment or health care operations purpose regarding a service that has been paid in full out-of-pocket.\n2. You have the right to request to receive confidential communications from us by alternative means or at an alternate location. We will comply with all reasonable requests submitted in writing which specify how or where you wish to receive these communications.\n3. You have the right to request to access, inspect, and copy your protected health information.\n4. You have the right to request an amendment of your protected health information. If we deny your request for amendment, you have the right to file a statement of disagreement with us. We may prepare a rebuttal to your statement, and we will provide you with a copy of any such rebuttal.\n5. You have the right to receive an accounting of certain disclosures of your protected health information that we have made, paper or electronic, except for certain disclosures which were pursuant to an authorization, for purposes of treatment, payment, or healthcare operations (unless the information is maintained in an electronic health record); or for certain other purposes.\n6. You have the right to obtain a paper copy of this Notice, upon request, even if you have previously requested its receipt electronically by e-mail.\n7. We will notify you if a breach of your unsecured protected health information is discovered.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'REVISIONS TO THIS NOTICE:',
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 19.sp,
                              color: hexColor('#121212'),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            'We reserve the right to revise this Notice and to make the revised Notice effective for protected health information we already have about you as well as any information we receive in the future. You are entitled to a copy of the Notice currently in effect. Any significant changes to this Notice will be posted on our website.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text(
                            'COMPLAINTS:',
                            style: BrandTextStyles.medium.copyWith(
                              fontSize: 19.sp,
                              color: hexColor('#121212'),
                            ),
                          ),
                          5.verticalSpace,
                          Text(
                            'Complaints about this Notice or how we handle your protected health information should be directed to our HIPAA Privacy Officer. You may also submit a formal complaint to the Department of Health and Human Services, Office for Civil Rights. We will not retaliate against you for filing a complaint.\n\nWe must follow the duties and privacy practices described in this Notice. If you have any questions about this Notice, please contact us at +1 070 XXXXX  and ask to speak with our HIPAA Privacy Officer.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          15.verticalSpace,
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'This Notice was originally published and effective on ',
                                  style: BrandTextStyles.regular.copyWith(
                                    fontSize: 14.sp,
                                    color: hexColor('#4E4E50'),
                                  ),
                                ),
                                TextSpan(
                                  text: '1st May 2025.',
                                  style: BrandTextStyles.semiBold.copyWith(
                                    fontSize: 14.sp,
                                    color: hexColor('#4E4E50'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          40.verticalSpace,
                          CustomTextField(
                            label: 'Patient First Name ',
                            hintText: 'Enter your first name',
                          ),
                          25.verticalSpace,
                          CustomTextField(
                            label: 'Patient Last Name ',
                            hintText: 'Enter your Last name',
                          ),
                          25.verticalSpace,
                          CustomTextField(label: 'Dete ', hintText: 'Date'),
                          25.verticalSpace,
                          CustomTextField(
                            label: 'Message ',
                            hintText: 'Type your message here...',
                            maxLines: 4,
                          ),
                          20.verticalSpace,
                          Text(
                            'If you are the parent or personal representative of the Patient, by clicking and typing the names indicated below, you acknowledge on behalf of the Patient that you have received or been given an opportunity to receive SugarPros’s Notice of Privacy Practices.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
                          ),
                          20.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 19.w,
                                height: 19.w,
                                margin: EdgeInsets.only(top: 4.h),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: hexColor('#4E4E50'),
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'I have received or been given an opportunity to receive ',
                                        style: BrandTextStyles.regular.copyWith(
                                          fontSize: 14.sp,
                                          color: hexColor('#4E4E50'),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'SugarPros’s ',
                                        style: BrandTextStyles.semiBold
                                            .copyWith(
                                              fontSize: 14.sp,
                                              color: hexColor('#4E4E50'),
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'Notice of Privacy Practices.',
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
                          15.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 19.w,
                                height: 19.w,
                                margin: EdgeInsets.only(top: 4.h),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: hexColor('#4E4E50'),
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'I have received or been given an opportunity to receive SugarPros’s ',
                                        style: BrandTextStyles.regular.copyWith(
                                          fontSize: 14.sp,
                                          color: hexColor('#4E4E50'),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'SugarPros’s ',
                                        style: BrandTextStyles.semiBold
                                            .copyWith(
                                              fontSize: 14.sp,
                                              color: hexColor('#4E4E50'),
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            'Notice of Privacy Practices on behalf of',
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
                          25.verticalSpace,
                          CustomTextField(
                            label: 'Patient Name ',
                            hintText: 'Enter your first name',
                          ),
                          25.verticalSpace,
                          CustomTextField(
                            label: 'Personal Representative’s Name',
                            hintText: 'Personal Representative’s Name',
                          ),
                          25.verticalSpace,
                          CustomTextField(label: 'Dete ', hintText: 'Date'),
                          25.verticalSpace,
                          CustomTextField(
                            label:
                                'State the nature of your relationship with the Patient and\ndescribe your authority to act for the Patient.',
                            hintText: 'Type your message here...',
                            maxLines: 4,
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
                            viewModel.forward();
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

class StepperCard extends StatelessWidget {
  const StepperCard({
    super.key,
    required this.step,
    required this.title,
    required this.isActive,
  });

  final String step;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30.w,
          height: 30.w,
          decoration: ShapeDecoration(
            color: isActive ? hexColor('#FF6400') : Colors.transparent,
            shape: CircleBorder(
              side: BorderSide(
                color: isActive ? hexColor('#FF6400') : hexColor('#A1A1A1'),
              ),
            ),
          ),
          child: Center(
            child: Text(
              step,
              style: BrandTextStyles.regular.copyWith(
                fontSize: 14.sp,
                color: isActive ? Colors.white : hexColor('#A1A1A1'),
              ),
            ),
          ),
        ),
        5.horizontalSpace,
        Text(
          title,
          style: BrandTextStyles.regular.copyWith(
            fontSize: 14.sp,
            color: isActive ? hexColor('#FF6400') : hexColor('#A1A1A1'),
          ),
        ),
        10.horizontalSpace,
        SvgIcon('double-arrow'.svg),
        10.horizontalSpace,
      ],
    );
  }
}
