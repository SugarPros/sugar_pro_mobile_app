

import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_password/change_password_viewmodel.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_password/cp_page1.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_password/cp_page2.dart';

class ChangePasswordView extends StackedView<ChangePasswordViewModel> {
  const ChangePasswordView({super.key});

  @override
  void onViewModelReady(ChangePasswordViewModel viewModel) {
  }

  @override
  Widget builder(BuildContext context, ChangePasswordViewModel viewModel, Widget? child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.isDarkMode ? Utils.darkThemeNav() : Utils.lightThemeNav,
      child: SizedBox(
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
                children: const [
                  CpPage1(),
                  CpPage2()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(BuildContext context) => ChangePasswordViewModel();
}
