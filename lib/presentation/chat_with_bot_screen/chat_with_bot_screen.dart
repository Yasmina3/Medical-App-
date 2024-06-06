import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'api.dart'; // Ensure this is properly defined in your project
import 'controller/chat_with_bot_controller.dart';
import 'models/chat_with_bot_model.dart';
import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_text_form_field.dart';
import 'package:tabibak/core/app_export.dart';


class ChatWithBotScreen extends StatefulWidget {
  ChatWithBotScreen({Key? key}) : super(key: key);

  @override
  _ChatWithBotScreenState createState() => _ChatWithBotScreenState();
}

class _ChatWithBotScreenState extends State<ChatWithBotScreen> {
  List<ChatMessage> conversationData = [];
  TextEditingController _typeMessageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  void _sendMessage() async {
    String message = _typeMessageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        conversationData.add(ChatMessage(sender: "user", message: message));
      });
      _typeMessageController.clear();
      _scrollToBottom();

      String botResponse = await fetchChatbotResponse(message);
      setState(() {
        conversationData.add(ChatMessage(sender: "bot", message: botResponse));
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _clearConversation() {
    setState(() {
      conversationData.clear();
      _typeMessageController.clear();
    });
    print("Conversation cleared"); // Debugging line
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _buildConsultationStart(),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: conversationData.length,
                itemBuilder: (context, index) {
                  return _buildChatMessage(conversationData[index]);
                },
              ),
            ),
            _buildTypeMessage(),
          ],
        ),
      ),
    );
  }
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 23.h,
      leading: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'clear') {
            _clearConversation();
          }
        },
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem<String>(
              value: 'clear',
              child: Text('Clear Conversation'),
            ),
          ];
        },
        icon: Icon(Icons.more_vert),
      ),
      title: AppbarSubtitleOne(
        text: "lbl40".tr,
        margin: EdgeInsets.only(left: 120.h),
      ),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgArrowRight,
              margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.v),
              onTap: () {
                onTapArrowRight();
              })
        ]
    );
  }

  Widget _buildConsultationStart() {
    return Container(
      margin: EdgeInsets.only(left: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 98.h, vertical: 13.v),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Text(
            "lbl41".tr,
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
          Text(
            "lbl2".tr,
            style: CustomTextStyles.titleMediumGray500,
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessage(ChatMessage message) {
    if (message.sender == "user") {
      return _buildChatUser(message.message);
    } else {
      return _buildChatBot(message.message);
    }
  }

  Widget _buildChatUser(String message) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now);

    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 13.h, top: 4.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "You",
                  style: CustomTextStyles.titleSmallOnPrimaryContainer,
                ),
                SizedBox(height: 4.v),
                Text(
                  formattedTime,
                  style: theme.textTheme.labelMedium,
                ),
                SizedBox(height: 4.v),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 250.h,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 8.v),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.colorScheme.primary.withOpacity(1),
                  ),
                  child: Text(
                    message,
                    style: CustomTextStyles.bodyLargeOnPrimary,
                  ),
                ),
                SizedBox(height: 10.v),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUserPrimary, // User avatar image
            height: 40.adaptSize,
            width: 40.adaptSize,
          ),
        ],
      ),
    );
  }

  Widget _buildChatBot(String message) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now);

    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgClose40x40, // Bot avatar image
            height: 40.adaptSize,
            width: 40.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(left: 13.h, top: 4.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_bot".tr, // Bot name
                  style: CustomTextStyles.titleSmallOnPrimaryContainer,
                ),
                SizedBox(height: 4.v),
                Text(
                  formattedTime, // Display the formatted current time
                  style: theme.textTheme.labelMedium,
                ),
                SizedBox(height: 4.v),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 250.h, // Max width for the bot message container
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 8.v,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.colorScheme.primary.withOpacity(0.1),
                  ),
                  child: Text(
                    message,
                    style: CustomTextStyles.bodyLargeGray700,
                  ),
                ),
                SizedBox(height: 10.v), // SizedBox for space after the message
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeMessage() {
    return Padding(
      padding: EdgeInsets.only(left: 21.h, right: 21.h, bottom: 26.v),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: _typeMessageController,
              hintText: "lbl42".tr,
              textInputAction: TextInputAction.done,
              contentPadding: EdgeInsets.only(left: 30.h, top: 15.v, bottom: 15.v),
            ),
          ),
          SizedBox(width: 10.h),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  onTapArrowRight() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }
}

class ChatMessage {
  final String sender;
  final String message;
  ChatMessage({required this.sender, required this.message});
}
