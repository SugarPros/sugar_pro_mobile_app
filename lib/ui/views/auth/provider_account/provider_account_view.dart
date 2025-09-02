
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/auth/provider_account/prov_page1.dart';
import 'package:sugar_pros/ui/views/auth/provider_account/prov_page2.dart';
import 'package:sugar_pros/ui/views/auth/provider_account/provider_account_viewmodel.dart';

class ProviderAccountView extends StackedView<ProviderAccountViewModel> {
 const ProviderAccountView({super.key});

 @override
 Widget builder(BuildContext context, ProviderAccountViewModel viewModel, Widget? child) {
   return PopScope(
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
                      ProvPage1(),
                      ProvPage2(),
                     ],
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
 ProviderAccountViewModel viewModelBuilder(BuildContext context) => ProviderAccountViewModel();
}