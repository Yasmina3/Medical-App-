import 'package:flutter/widgets.dart';
import 'package:tabibak/widgets/app_bar/appbar_title.dart';
import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_radio_button.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/special_questions_controller.dart';

class SpecialQuestionsScreen extends GetWidget<SpecialQuestionsController> {
  const SpecialQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 16.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 6.h),
                          child: AnotherStepper(
                              stepperDirection: Axis.horizontal,
                              activeIndex: 3,
                              barThickness: 5,
                              inverted: true,
                              stepperList: [
                                StepperData(),
                                StepperData(),
                                StepperData(),
                                StepperData(),
                                StepperData()
                              ])),
                      SizedBox(height: 38.v),
                       Align(
                          alignment: Alignment.center,
                          child: Text("lbl24".tr,
                              style: theme.textTheme.headlineLarge)),
                      Spacer(flex: 30),
                      YesNoQuestionWidget(
                      question: 'هل تعاني من أي حساسية؟',
                        ),
                      
                      SizedBox(height: 30.v),
                      YesNoQuestionWidget(
                      question: "msg15".tr,
                        ),
                      SizedBox(height: 30.v),
                      
                      YesNoQuestionWidget(
                      question: "msg16".tr,
                        ),
                    ])),
            bottomNavigationBar: _buildTf()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back), // Use Material Icons' arrow_back icon
      onPressed: () => Navigator.of(context).pop(), // Navigate back on press
    ),
    actions: <Widget>[
      AppbarTitle(
              text: "lbl".tr,
              margin: EdgeInsets.fromLTRB(27.h, 13.v, 27.h, 10.v))
    ],
  );
}


  /// Section Widge
  /// Section Widget
  Widget _buildTf() {
    return CustomElevatedButton(
        height: 59.v,
        width: 149.h,
        text: "lbl27".tr,
        margin: EdgeInsets.only(left: 113.h, right: 113.h, bottom: 44.v),
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.titleMediumNunitoOnPrimaryExtraBold,
        onPressed: () {
          onTaptf();
        });
  }

  /// Navigates to the doneScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.doneScreen,
    );
  }
}


class YesNoQuestionWidget extends StatefulWidget {
  final String question;

  const YesNoQuestionWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  _YesNoQuestionWidgetState createState() => _YesNoQuestionWidgetState();
}

class _YesNoQuestionWidgetState extends State<YesNoQuestionWidget> {
  String? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Force left-to-right direction
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end, // Align to the left
        children: [
          Text(
            widget.question,
            style: TextStyle(fontSize: 22, color: Colors.black),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 8), // Add some spacing between the question and options
          _buildOption("lbl25".tr, 'no'),
          _buildOption("lbl26".tr, 'yes'),
        ],
      ),
    );
  }

  Widget _buildOption(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // Align the Row's children to the left
      children: [
                Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Radio<String>(
          value: value,
          groupValue: _selectedAnswer,
          onChanged: (String? newValue) {
            setState(() {
              _selectedAnswer = newValue;
            });
          },
          activeColor: Colors.blue,
        ),

      ],
    );
  }
}

