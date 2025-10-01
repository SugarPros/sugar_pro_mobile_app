import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/book_appointment_viewmodel.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/cash_payment.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/medicare.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/select_plan.dart';

class BookAppointmentView extends StackedView<BookAppointmentViewModel> {
  const BookAppointmentView({super.key});

  @override
  Widget builder(BuildContext context, BookAppointmentViewModel viewModel, Widget? child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.isDarkMode ? Utils.darkTheme : Utils.lightTheme,
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
                      children: [SelectPlan(), Medicare(), CashPayment()],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  BookAppointmentViewModel viewModelBuilder(BuildContext context) => BookAppointmentViewModel();
}