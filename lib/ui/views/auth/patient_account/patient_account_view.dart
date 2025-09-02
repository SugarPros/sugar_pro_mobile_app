
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_otp.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_page1.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_page2.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_page3.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_page4.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_page5.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_page6.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_page7.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_page8.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_page9.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/pa_personal_detail.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/patient_account_viewmodel.dart';

class PatientAccountView extends StackedView<PatientAccountViewModel> {
 const PatientAccountView({super.key});

 @override
 Widget builder(BuildContext context, PatientAccountViewModel viewModel, Widget? child) {
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
                         PaPage1(),
                         PaPage2(),
                         PaPage3(),
                         PaPage4(),
                         PaPage5(),
                         PaPage6(),
                         PaPage7(),
                         PaPage8(),
                         PaPage9(),
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
 PatientAccountViewModel viewModelBuilder(BuildContext context) => PatientAccountViewModel();
}