
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/profile_viewmodel.dart';

class PatientProfileView extends StackedView<ProfileViewModel> {
 const PatientProfileView({super.key});

 @override
 Widget builder(BuildContext context, ProfileViewModel viewModel, Widget? child) {
   return const Scaffold();
 }

 @override
 ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}