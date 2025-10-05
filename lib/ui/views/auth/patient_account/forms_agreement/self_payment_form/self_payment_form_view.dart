import 'package:dotted_border/dotted_border.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/self_payment_form/self_payment_form_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class SelfPaymentFormView extends StatelessWidget {
  const SelfPaymentFormView({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelfPaymentViewModel>.reactive(
      viewModelBuilder: () => SelfPaymentViewModel(),
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
                        onTap: () => locator<NavigationService>().back(),
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
                            controller: viewModel.signDateCtrl,
                            initialDate: DateTime.now(),
                            startDate: DateTime.now(),
                            stopDate: DateTime(2053),
                            onDateSelected: (value) => viewModel.signDate = value,
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
                                        text: 'I understand and agree to this Agreement. ',
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
