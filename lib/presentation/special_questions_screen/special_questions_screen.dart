import 'package:flutter/widgets.dart';
import 'package:tabibak/presentation/UserController.dart';
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
                      question: 'هل تعاني من أي حساسية؟',cases : "Allergy"
                        ),
                      
                      SizedBox(height: 30.v),
                      YesNoQuestionWidget(
                      question: "msg15".tr,cases : "long-term Disease"
                        ),
                      SizedBox(height: 30.v),
                      
                      YesNoQuestionWidget(
                      question: "msg16".tr,cases : "rare disease"
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
          List<String> specs = Get.find<UserController>().special_cases.value;
          print("specs = ${specs}");
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
  final String cases;

  const YesNoQuestionWidget({
    Key? key,
    required this.question,
    required this.cases,
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
          _buildOption("lbl25".tr, 'no',widget.cases),
          _buildOption("lbl26".tr, 'yes',widget.cases),
        ],
      ),
    );
  }

  Widget _buildOption(String title, String value,String chosen_case) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
              print("value =$_selectedAnswer");
              print("case = ${chosen_case}");
              if (chosen_case == "Allergy") {

                _selectedAnswer == "no"
                    ? Get.find<UserController>().special_cases.value[0] = "2"
                    : Get.find<UserController>().special_cases.value[0] = "1";
              } else if (chosen_case == "long-term Disease") {
                print("long-term ");
                _selectedAnswer == "no"
                    ? Get.find<UserController>().special_cases.value[1] = "2"
                    : Get.find<UserController>().special_cases.value[1] = "1";
              } else {
                print("rare disease ");
                _selectedAnswer == "no"
                    ? Get.find<UserController>().special_cases.value[2] = "2"
                    : Get.find<UserController>().special_cases.value[2] = "1";
              }
            });
          },
          activeColor: Colors.blue,
        ),
      ],
    );
  }

}

