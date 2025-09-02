import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:sugar_pros/core/models/patients_chat_respose.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_chat_history/provider_chats/provider_chats_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/custom_network_image.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class ProviderChatsView extends StatefulWidget {
  const ProviderChatsView({super.key, required this.chatItem});

  final PatientsChatItem chatItem;

  @override
  State<ProviderChatsView> createState() => _ProviderChatsViewState();
}

class _ProviderChatsViewState extends State<ProviderChatsView> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProviderChatsViewModel>.reactive(
      viewModelBuilder: () => ProviderChatsViewModel(),
      onViewModelReady: (viewModel) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          viewModel.setup(widget.chatItem.patientId);
        });
      },
      builder:
          (context, viewModel, child) => Scaffold(
            backgroundColor: hexColor('#F3F4F6'),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      70.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => locator<NavigationService>().back(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgIcon('back'.svg),
                              ),
                            ),
                            5.horizontalSpace,
                            Expanded(
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: CustomNetworkImage(
                                      imageUrl:
                                          'http://31.97.14.107:8080/${widget.chatItem.profilePicture}',
                                      width: 50.w,
                                      height: 50.w,
                                    ),
                                  ),
                                  10.horizontalSpace,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.chatItem.name ?? '',
                                        style: BrandTextStyles.semiBold.copyWith(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Online',
                                        style: BrandTextStyles.regular.copyWith(
                                          fontSize: 14.sp,
                                          color: hexColor('#4A5565'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SvgIcon('vert'.svg),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: DashChat(
                      currentUser: viewModel.provider,
                      onSend: (ChatMessage msg) => viewModel.sendMessage(message: msg.text),
                      messages: viewModel.messages.reversed.toList(),
                      messageListOptions: MessageListOptions(),
                      messageOptions: MessageOptions(
                        showTime: true,
                        messageRowBuilder: (
                          message,
                          previousMessage,
                          nextMessage,
                          isAfterDateSeparator,
                          isBeforeDateSeparator,
                        ) {
                          final isProvider = message.user.id == 'provider';
                          if (isProvider) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.h,
                                      horizontal: 20.w,
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 16.h),
                                    decoration: ShapeDecoration(
                                      color: hexColor('#2889AA'), // Provider bubble color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12.r),
                                          topRight: Radius.circular(12.r),
                                          bottomLeft: Radius.circular(12.r),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      message.text,
                                      style: BrandTextStyles.regular.copyWith(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                // ✅ status for provider
                                if (message.status == MessageStatus.sent)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [Icon(Icons.check, color: Colors.black, size: 15.h)],
                                  )
                                else if (message.status == MessageStatus.read)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        DateFormatUtil.formatMessageTime(
                                          message.customProperties?['createdAt'],
                                        ),
                                        style: BrandTextStyles.regular.copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      5.horizontalSpace,
                                      SvgIcon('dot'.svg, color: Colors.black),
                                      5.horizontalSpace,
                                      SvgIcon('double-check'.svg),
                                    ],
                                  ),
                              ],
                            );
                          } else {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(100.r),
                                        child: CustomNetworkImage(
                                          imageUrl:
                                              'http://31.97.14.107:8080/${widget.chatItem.profilePicture}',
                                          height: 30.w,
                                          width: 30.w,
                                        ),
                                      ),
                                      10.horizontalSpace,
                                      Text(
                                        widget.chatItem.name ?? '',
                                        style: BrandTextStyles.medium.copyWith(
                                          fontSize: 14.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      5.horizontalSpace,
                                      SvgIcon('dot'.svg),
                                      4.horizontalSpace,
                                      Text(
                                        DateFormatUtil.formatMessageTime(
                                          message.customProperties?['createdAt'],
                                        ),
                                        style: BrandTextStyles.regular.copyWith(
                                          fontSize: 12.sp,
                                          color: hexColor('#B5B5B5'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 16.h),
                                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                                    decoration: ShapeDecoration(
                                      color: Colors.white, // Patient bubble color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12.r),
                                          bottomRight: Radius.circular(12.r),
                                          bottomLeft: Radius.circular(12.r),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      message.text,
                                      style: BrandTextStyles.regular.copyWith(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                      inputOptions: InputOptions(
                        textController: viewModel.messageCtrl,
                        focusNode: _focusNode,
                        inputDecoration: InputDecoration(
                          filled: true,
                          hintText: 'Type here..',
                          hintStyle: BrandTextStyles.regular.copyWith(
                            color: hexColor('#334155'),
                            fontSize: 14.sp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: hexColor('#E6EBF0')),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: hexColor('#E6EBF0')),
                          ),
                          enabled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                          suffixIcon: InkWell(
                            onTap: () {
                              final text = viewModel.messageCtrl.text.trim();
                              if (text.isNotEmpty) {
                                viewModel.sendMessage(message: text);
                                viewModel.messageCtrl.clear();
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Icon(Icons.send, color: BrandColors.primary),
                            ),
                          ),
                          fillColor: _isFocused ? hexColor('#F8FAFC') : hexColor('#F3F4F6'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: hexColor('#E6EBF0')),
                          ),
                        ),
                        sendButtonBuilder: (_) => const SizedBox(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
