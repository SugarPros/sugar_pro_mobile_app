
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/results/results_viewmodel.dart';

class PatientResultsView extends StackedView<ResultsViewModel> {
 const PatientResultsView({super.key});

 @override
 Widget builder(BuildContext context, ResultsViewModel viewModel, Widget? child) {
   return const Scaffold();
 }

 @override
 ResultsViewModel viewModelBuilder(BuildContext context) => ResultsViewModel();
}