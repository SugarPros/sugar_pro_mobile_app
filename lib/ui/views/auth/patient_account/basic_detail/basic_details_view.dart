
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/basic_details_viewmodel.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/pa_page1.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/pa_page2.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/pa_page3.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/pa_page4.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/pa_page5.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/pa_page6.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/pa_page7.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/pa_page8.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/basic_detail/pa_page9.dart';

class BasicDetailsView extends StackedView<BasicDetailsViewModel> {
 const BasicDetailsView({super.key});

 @override
 Widget builder(BuildContext context, BasicDetailsViewModel viewModel, Widget? child) {
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
 BasicDetailsViewModel viewModelBuilder(BuildContext context) => BasicDetailsViewModel();
}