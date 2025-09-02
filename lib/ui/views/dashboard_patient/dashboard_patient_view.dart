// ignore_for_file: deprecated_member_use

import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/chat/patient_chat_history_view.dart'
    show PatientChatHistoryView;
import 'package:sugar_pros/ui/views/dashboard_patient/results/results_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/dashboard_patient_viewmodel.dart';
import 'package:flutter/scheduler.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/home/patient_home_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/appointment_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/profile_view.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class DashboardPatientView extends StatelessWidget {
  const DashboardPatientView({super.key, this.index});

  final int? index;

  void openMenu() {}

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardPatientViewModel>.reactive(
      viewModelBuilder: () => DashboardPatientViewModel(),
      onViewModelReady: (viewModel) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          viewModel.setIndex(index ?? 0);
        });
      },
      builder:
          (context, viewModel, child) => AnnotatedRegion<SystemUiOverlayStyle>(
            value: context.isDarkMode ? Utils.darkTheme : Utils.lightTheme,
            child: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Stack(
                children: [
                  Scaffold(
                    body: [
                      const PatientHomeView(),
                      const PatientChatHistoryView(),
                      const PatientAppointmentView(),
                      const PatientResultsView(),
                      const PatientProfileView(),
                    ].elementAt(viewModel.currentIndex),
                    bottomNavigationBar: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                       decoration: ShapeDecoration(
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                      ),
                    ),
                      child: BottomNavigationBar(
                        backgroundColor: Colors.white,
                        type: BottomNavigationBarType.fixed,
                        selectedLabelStyle: BrandTextStyles.bold.copyWith(
                          fontSize: 12.sp,
                          color: hexColor('#FF6400'),
                        ),
                        unselectedLabelStyle: BrandTextStyles.regular
                            .copyWith(
                              fontSize: 12.sp,
                              color: hexColor('#A3A3A3'),
                            ),
                        selectedItemColor: hexColor('#FF6400'),
                        unselectedItemColor: hexColor('#A3A3A3'),
                        elevation: 0,
                        currentIndex: viewModel.currentIndex,
                        onTap: viewModel.setIndex,
                        items: [
                          bottomBarItem(
                            context: context,
                            name: 'Home',
                            iconPath: 'home'.svg,
                            semanticLabel: 'Home',
                            activeSemanticLabel: 'Home Navigator is Active',
                          ),
                          bottomBarItem(
                            context: context,
                            name: 'Chat',
                            iconPath: 'chat'.svg,
                            semanticLabel: 'Chat',
                            activeSemanticLabel: 'Chat Navigator is Active',
                          ),
                          bottomBarItem(
                            context: context,
                            name: 'Appointment',
                            iconPath: 'appointment'.svg,
                            semanticLabel: 'Appointment',
                            activeSemanticLabel:
                                'Appointment Navigator is Active',
                          ),
                          bottomBarItem(
                            context: context,
                            name: 'My Data',
                            iconPath: 'book'.svg,
                            semanticLabel: 'Results',
                            activeSemanticLabel:
                                'Results Navigator is Active',
                          ),
                          bottomBarItem(
                            context: context,
                            name: 'Profile',
                            iconPath: 'profile'.svg,
                            semanticLabel: 'Results',
                            activeSemanticLabel:
                                'Results Navigator is Active',
                          ),
                        ],
                      ),
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: AnimatedContainer(
                      duration: 300.milliseconds,
                      width: double.infinity,
                      height: double.infinity,
                      color:
                          viewModel.showMenu
                              ? Colors.black.withOpacity(.5)
                              : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  // BottomNavigationBarItem bottomBarItem({
  //   required BuildContext context,
  //   required String name,
  //   required String iconPath,
  //   required String activeIconPath,
  //   required String semanticLabel,
  //   required String activeSemanticLabel,
  //   bool? isPng,
  // }) {
  //   return BottomNavigationBarItem(
  //     label: name,
  //     icon: Column(
  //       children: [
  //         5.verticalSpace,
  //         if (isPng ?? false)
  //           Image.asset(iconPath)
  //         else
  //           SvgPicture.asset(
  //             iconPath,
  //             height: 20.h,
  //             width: 20.h,
  //             color: hexColor('#A3A3A3'),
  //             semanticsLabel: semanticLabel,
  //             fit: BoxFit.fill,
  //           ),
  //       ],
  //     ),
  //     activeIcon: Column(
  //       children: [
  //         5.verticalSpace,
  //         if (isPng ?? false)
  //           Image.asset(activeIconPath)
  //         else
  //           SvgPicture.asset(
  //             activeIconPath,
  //             height: 20.h,
  //             width: 20.h,
  //             color: hexColor('#FF6400'),
  //             semanticsLabel: activeSemanticLabel,
  //           ),
  //       ],
  //     ),
  //   );
  // }

  BottomNavigationBarItem bottomBarItem({
    required BuildContext context,
    required String name,
    required String iconPath,
    required String semanticLabel,
    required String activeSemanticLabel,
  }) {
    return BottomNavigationBarItem(
      label: name,
      icon: Column(
        children: [
          5.verticalSpace,
          SvgIcon(iconPath, height: 20.w, width: 20.w),
          5.verticalSpace,
        ],
      ),
      activeIcon: Column(
        children: [
          5.verticalSpace,
          SvgIcon(iconPath, height: 20.w, width: 20.w),
          5.verticalSpace,
        ],
      ),
    );
  }
}
