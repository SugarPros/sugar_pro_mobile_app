import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/forms_agreement_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PatientAgreementForm2 extends StatelessWidget {
  const PatientAgreementForm2({super.key});

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
                    children: [
                      InkWell(
                        onTap: () => log('ddd'),
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: SvgIcon('back'.svg),
                        ),
                      ),
                      5.horizontalSpace,
                      Text(
                        'Agreement for Self-Payment of Services',
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
                            '[SugarPros] and affiliated medical groups (collectively, [SugarPros]) is committed to providing the best quality healthcare services. We do not participate in any insurance plans, including Medicare or Medicaid, and we do not accept any health insurance whatsoever. Our services are 100% self-pay by our patients. By signing this form, you acknowledge that\n\n1) You do not have any health insurance through a PPO, HMO, Medicaid or Medicare or any other insurance plan\n\n2) You have health insurance but you do not want to use any insurance benefit for these services, acknowledging that [SugarPros] does not accept any health insurance. Your insurance policy is a contract between you and your insurance company. It is your responsibility to know your benefits, and how they will apply to your benefit payments, and we take no responsibility to understand or be bound by the terms and conditions of such insurance.\n\nBy signing this form, you are electing to purchase services that may or may not be covered by your insurance if you obtained those services from a different provider. You have selected services for purchase from us on a self-pay basis. In other words, you have directed us to treat your purchase of these services as if you are an uninsured patient and you agree to be 100% responsible for full payment of the listed price of the services. There is no guarantee your insurance company will make any payment on the cost of the services you have purchased.\n\n[SugarPros] has provided you with the charges, in advance, for the services you have requested. By signing below, you agree to pay these charges in full as a self-pay patient, electing not to use an insurance policy benefit. You have been given a choice of different services, along with their costs. You have selected the services and are willing to accept full financial responsibility for payment. I have read the Agreement for Self-Payment of Services.',
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
                                margin: EdgeInsets.only(top: 0.h),
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
                                            'I understand and agree to this Agreement. ',
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
                          30.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            viewModel.navigateToDashboard();
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
