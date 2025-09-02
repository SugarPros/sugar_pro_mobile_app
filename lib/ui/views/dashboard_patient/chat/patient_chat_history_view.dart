
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/chat/patient_chat_history_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/custom_network_image.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';


class PatientChatHistoryView extends StackedView<PatientChatHistoryViewModel> {
 const PatientChatHistoryView({super.key});

 @override
 Widget builder(BuildContext context, PatientChatHistoryViewModel viewModel, Widget? child) {
  return Scaffold(
      backgroundColor: hexColor('#F3F4F6'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: hexColor('#2889AA'),
        child: SvgIcon('ai-chat'.svg),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                70.verticalSpace,
                Text(
                  'SugarPros Chats',
                  style: BrandTextStyles.semiBold.copyWith(fontSize: 18.sp, color: Colors.black),
                ),
                20.verticalSpace,
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    15.verticalSpace,
                    CustomTextField(
                      fillColor: Colors.white,
                      border: false,
                      borderColor: Colors.transparent,
                      radius: 100.r,
                      hintText: 'Search Something...',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 15.w, right: 10.w),
                        child: SvgIcon('search'.svg),
                      ),
                    ),
                    15.verticalSpace,
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15.w),
                          decoration: ShapeDecoration(
                            color: hexColor('#2889AA'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          child: Text(
                            'All',
                            style: BrandTextStyles.semiBold.copyWith(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        if (viewModel.chatData?.totalUnread != 0)
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15.w),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Unread Messages',
                                  style: BrandTextStyles.semiBold.copyWith(
                                    fontSize: 14.sp,
                                    color: hexColor('#364153'),
                                  ),
                                ),
                                5.horizontalSpace,
                                Container(
                                  padding: EdgeInsets.all(5.w),
                                  decoration: ShapeDecoration(
                                    color: hexColor('#FF6400'),
                                    shape: CircleBorder(),
                                  ),
                                  child: Text(
                                    '${viewModel.chatData?.totalUnread ?? 0}',
                                    style: BrandTextStyles.bold.copyWith(
                                      fontSize: 10.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    20.verticalSpace,
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.chatHistoryList?.length ?? 0,
                      separatorBuilder: (ctx, i) => 20.verticalSpace,
                      itemBuilder: (ctx, i) {
                        final chat = viewModel.chatHistoryList?[i];
                        return ChatTile(
                          img: 'http://31.97.14.107:8080/${chat?.senderImage}',
                          name: chat?.senderName,
                          lastMessage: chat?.mainMessage,
                          messageStatus: chat?.status,
                          messageTime: chat?.createdAt,
                          onTap: () => {}
                        );
                      },
                    ),
                    50.verticalSpace,
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
 PatientChatHistoryViewModel viewModelBuilder(BuildContext context) => PatientChatHistoryViewModel();
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.img,
    required this.name,
    required this.lastMessage,
    required this.messageStatus,
    required this.messageTime,
    required this.onTap,
  });

  final String? img;
  final String? name;
  final String? lastMessage;
  final String? messageStatus;
  final String? messageTime;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasLastMessage = (lastMessage != null && lastMessage!.isNotEmpty);
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: CustomNetworkImage(imageUrl: img, width: 40.w, height: 40.h),
          ),
          10.horizontalSpace,
          Expanded(
            child:
                hasLastMessage
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name ?? '',
                          style: BrandTextStyles.semiBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          lastMessage!,
                          style: BrandTextStyles.regular.copyWith(
                            fontSize: 14.sp,
                            color: hexColor('#4A5565'),
                          ),
                        ),
                      ],
                    )
                    : Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        name ?? '',
                        style: BrandTextStyles.semiBold.copyWith(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormatUtil.formatMessageTime(messageTime),
                style: BrandTextStyles.regular.copyWith(
                  fontSize: 12.sp,
                  color: hexColor('#6A7282'),
                ),
              ),
              10.verticalSpace,
            messageStatus == 'seen' ?  SvgIcon('double-check'.svg) : Icon(Icons.check, color: Colors.black, size: 15,),
            ],
          ),
        ],
      ),
    );
  }
}