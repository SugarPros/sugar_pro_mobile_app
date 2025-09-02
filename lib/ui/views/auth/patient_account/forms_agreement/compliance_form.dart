import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/forms_agreement_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class ComplianceForm extends StatelessWidget {
  const ComplianceForm({super.key});

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
                            label: 'Patient First Name',
                            hintText: 'Enter your first name',
                          ),
                          25.verticalSpace,
                          CustomTextField(
                            label: 'Patient Last Name',
                            hintText: 'Enter your Last name',
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
                            'I have read the above information and authorize Sugar Pros to use or disclose the identified information for the purposes described herein.\nBy signing your name below, you acknowledge that you have read and agree to the terms of this Authorization.',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 14.sp,
                              color: hexColor('#4E4E50'),
                            ),
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
