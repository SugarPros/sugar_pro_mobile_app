import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:sugar_pros/core/models/provider_ai_chatlist_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_chat_history/provider_chats/pd_ai_chat/pd_ai_chat_viewmodel.dart';
import 'package:sugar_pros/ui/widgets/svg_icon.dart';

class PdAiChatView extends StatefulWidget {
  const PdAiChatView({super.key, required this.chatItem});

  final ProviderAIChatList chatItem;

  @override
  State<PdAiChatView> createState() => _PdAiChatViewState();
}

class _PdAiChatViewState extends State<PdAiChatView> {
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
    return ViewModelBuilder<PdAiChatViewModel>.reactive(
      viewModelBuilder: () => PdAiChatViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.setup(widget.chatItem.chatuid);
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
                            10.horizontalSpace,
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'SugarPros Al',
                                    style: BrandTextStyles.semiBold.copyWith(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                    ),
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
                      typingUsers: viewModel.typingUsers,
                      messageOptions: MessageOptions(
                        messageRowBuilder: (
                          message,
                          previousMessage,
                          nextMessage,
                          isAfterDateSeparator,
                          isBeforeDateSeparator,
                        ) {
                          final isAI = message.user.id == 'AI';
                          if (isAI) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                                    margin: EdgeInsets.symmetric(vertical: 16.h),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12.r),
                                          bottomLeft: Radius.circular(12.r),
                                          bottomRight: Radius.circular(12.r),
                                        ),
                                      ),
                                    ),
                                    child: MarkdownBody(
                                      data: message.text,
                                      styleSheet: MarkdownStyleSheet.fromTheme(
                                        Theme.of(context),
                                      ).copyWith(
                                        p: BrandTextStyles.regular.copyWith(
                                          fontSize: 14.sp,
                                          color: Colors.black,
                                        ),
                                        code: BrandTextStyles.regular.copyWith(
                                          fontSize: 14.sp,
                                          backgroundColor: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 16.h),
                                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                                    decoration: ShapeDecoration(
                                      color: hexColor('#E5E7EB'),
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
                                        color: hexColor('#030712'),
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
