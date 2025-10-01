import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_chat_history/patient_chat/pa_ai_chat_history/pa_ai_chat_history_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PaAiChatHistoryView extends StackedView<PaAiChatHistoryViewModel> {
  const PaAiChatHistoryView({super.key});

  @override
  void onViewModelReady(PaAiChatHistoryViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchAiChats();
    });
  }

  @override
  Widget builder(BuildContext context, PaAiChatHistoryViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
       floatingActionButton: FloatingActionButton(
        onPressed: viewModel.clearChat,
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Image.asset('new-chat'.png),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                70.verticalSpace,
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 18.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => locator<NavigationService>().back(),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: ShapeDecoration(
                            color: hexColor('#F1F5F9'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(color: hexColor('#E2E8F0'), width: 1),
                            ),
                          ),
                          child: SvgIcon('back'.svg),
                        ),
                      ),
                      Text(
                        'SugarPros Al',
                        style: BrandTextStyles.semiBold.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20.w, height: 20.w),
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: viewModel.groupAIChatListByDate().length,
                      itemBuilder: (ctx, i) {
                        final dateGroup = viewModel.groupAIChatListByDate().keys.elementAt(i);
                        final aiChatForDate = viewModel.groupAIChatListByDate()[dateGroup];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dateGroup,
                              style: BrandTextStyles.semiBold.copyWith(
                                fontSize: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                            10.verticalSpace,
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: aiChatForDate?.length ?? 0,
                              separatorBuilder: (ctx, i) => 15.verticalSpace,
                              itemBuilder: (ctx, i) {
                                final aiChat = aiChatForDate?[i];
                                return InkWell(
                                  onTap: () => viewModel.navigateToAIChatView(aiChat?.chatuid),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusGeometry.circular(10.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            aiChat?.message ?? '',
                                            style: BrandTextStyles.regular.copyWith(
                                              fontSize: 16.sp,
                                              color: hexColor('#262626'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            20.verticalSpace,
                          ],
                        );
                      },
                    ),
                    SizedBox(height: bottomPadding(context) + 20.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PaAiChatHistoryViewModel viewModelBuilder(BuildContext context) => PaAiChatHistoryViewModel();
}
