

import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_email/ce_page1.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_email/ce_page2.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_email/change_email_viewmodel.dart';

class ChangeEmailView extends StackedView<ChangeEmailViewModel> {
  const ChangeEmailView({super.key});

  @override
  void onViewModelReady(ChangeEmailViewModel viewModel) {
  }

  @override
  Widget builder(BuildContext context, ChangeEmailViewModel viewModel, Widget? child) {
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
                  CePage1(),
                  CePage2()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChangeEmailViewModel viewModelBuilder(BuildContext context) => ChangeEmailViewModel();
}
