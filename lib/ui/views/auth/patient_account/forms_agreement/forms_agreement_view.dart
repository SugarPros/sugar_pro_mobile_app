
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/compliance_form.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/forms_agreement_viewmodel.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/patient_agreement_form1.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/patient_agreement_form2.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/privacy_form.dart';

class FormsAgreementView extends StackedView<FormsAgreementViewModel> {
 const FormsAgreementView({super.key});

 @override
 Widget builder(BuildContext context, FormsAgreementViewModel viewModel, Widget? child) {
   return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.isDarkMode ? Utils.darkTheme : Utils.lightTheme,
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: viewModel.pageController,
                        onPageChanged: (index) {
                          viewModel.setIndex(index);
                          viewModel.activeIndex = index;
                        },
                        children: [
                         PrivacyForm(),
                         ComplianceForm(),
                         PatientAgreementForm1(),
                         PatientAgreementForm2(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
 }

 @override
 FormsAgreementViewModel viewModelBuilder(BuildContext context) => FormsAgreementViewModel();
}