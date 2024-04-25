import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:tabibak/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/chat_with_bot_controller.dart';
import 'models/chat_with_bot_model.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'api.dart';


class ChatWithBotScreen extends GetWidget<ChatWithBotController> {
  List<ChatMessage> conversationData = [];

  void setState(VoidCallback fn) {
    conversationData = List.from(conversationData);
    fn();
  }

  ChatWithBotScreen({Key? key}) : super(key: key) {
    conversationData = [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 32.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildConsultationStart(),
              SizedBox(height: 20.v),
              Expanded(
                child: ListView.builder(
                  itemCount: conversationData.length,
                  itemBuilder: (context, index) {
                    return _buildChatMessage(conversationData[index]);
                  },
                ),
              ),
              SizedBox(height: 15.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildTypeMessage(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 23.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(
          left: 19.h,
          top: 19.v,
          bottom: 20.v,
        ),
      ),
      title: AppbarSubtitleOne(
        text: "lbl40".tr,
        margin: EdgeInsets.only(left: 120.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconChevronLeftGray90024x24,
          margin: EdgeInsets.fromLTRB(34.h, 14.v, 34.h, 17.v),
        ),
      ],
    );
  }

  Widget _buildConsultationStart() {
    return Container(
      margin: EdgeInsets.only(left: 1.h),
      padding: EdgeInsets.symmetric(
        horizontal: 98.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
    // Get the current time
    DateTime now = DateTime.now();

    // Format the time as "HH:mm" (24-hour format)
    String formattedTime = DateFormat('HH:mm').format(now);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 4.v),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "You", // Displaying "You" as the sender
                style: CustomTextStyles.titleSmallOnPrimaryContainer,
              ),
              Text(
                formattedTime, // Display the formatted current time
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
          SizedBox(height: 4.v), // SizedBox for spacing
          Text(
            message,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyLargeOnPrimary.copyWith(
              color: theme.colorScheme.onPrimary.withOpacity(1),
              height: 1.11,
            ),
          ),
          SizedBox(height: 10.v), // SizedBox for space after the message
        ],
      ),
    );
  }





  Widget _buildChatBot(String message) {
    // Get the current time
    DateTime now = DateTime.now();

    // Format the time as "HH:mm" (24-hour format)
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
            padding: EdgeInsets.only(
              left: 13.h,
              top: 4.v,
            ),
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
              controller: controller.typeMessageController,
              hintText: "lbl42".tr,
              textInputAction: TextInputAction.done,
              contentPadding: EdgeInsets.only(left: 30.h, top: 15.v, bottom: 15.v),
            ),
          ),
          SizedBox(width: 10.h),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () async {
              String message = controller.typeMessageController.text;
              conversationData.add(ChatMessage(sender: "user", message: message));
              controller.typeMessageController.clear();
              String botResponse = await fetchChatbotResponse(message);
              conversationData.add(ChatMessage(sender: "bot", message: botResponse));

              // Manually trigger UI update
              Get.find<ChatWithBotController>().update();
            },
          ),
        ],
      ),
    );
  }

}

class ChatMessage {
  final String sender; // "user" or "bot"
  final String message;

  ChatMessage({required this.sender, required this.message});
}