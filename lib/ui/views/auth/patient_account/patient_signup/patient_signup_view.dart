
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/patient_signup/pa_otp.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/patient_signup/pa_personal_detail.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/patient_signup/patient_signup_viewmodel.dart';

class PatientSignupView extends StackedView<PatientSignupViewModel> {
 const PatientSignupView({super.key});

 @override
 Widget builder(BuildContext context, PatientSignupViewModel viewModel, Widget? child) {
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
                         PaPersonalDetails(),
                         PaOtp(),
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
 PatientSignupViewModel viewModelBuilder(BuildContext context) => PatientSignupViewModel();
}