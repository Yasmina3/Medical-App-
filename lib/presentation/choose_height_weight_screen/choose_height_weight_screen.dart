import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/choose_height_weight_controller.dart';

class ChooseHeightWeightScreen extends GetWidget<ChooseHeightWeightController> {
  const ChooseHeightWeightScreen({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView( // Wrap the Column in a SingleChildScrollView
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 11.v),
          child: Column(
            children: [
              AnotherStepper(
                stepperDirection: Axis.horizontal,
                activeIndex: 2,
                barThickness: 5,
                inverted: true,
                stepperList: [
                  StepperData(),
                  StepperData(),
                  StepperData(),
                  StepperData(),
                  StepperData()
                ]
              ),
              SizedBox(height: 39.v),
              Text("lbl21".tr, style: theme.textTheme.headlineLarge),
              SizedBox(height: 81.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 21.h, right: 33.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("lbl22".tr, style: theme.textTheme.headlineLarge),
                      Text("lbl23".tr, style: theme.textTheme.headlineLarge)
                    ]
                  )
                )
              ),
              SizedBox(height: 51.v),
              Container(
                height: MediaQuery.of(context).size.height * 0.4, // 40% of screen height for selectors
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: HeightSelector(
                        initialHeight: 160, // Default or previously selected height
                        onHeightSelected: (height) {
                          print('Selected Height: $height');
                          // Perform actions with the selected height
                        },
                      ),
                    ),
                    Expanded(
                      child: WeightSelector(
                        initialWeight: 70, // Default or previously selected weight
                        onWeightSelected: (weight) {
                          print('Selected Weight: $weight');
                          // Perform actions with the selected weight
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildTf(),
    ),
  );
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

  /// Section Widget
  Widget _buildTf() {
    return CustomElevatedButton(
        height: 59.v,
        width: 149.h,
        text: "lbl16".tr,
        margin: EdgeInsets.only(left: 113.h, right: 113.h, bottom: 44.v),
        buttonStyle: CustomButtonStyles.outlineBlack,
        buttonTextStyle: CustomTextStyles.titleMediumNunitoOnPrimaryExtraBold,
        onPressed: () {
          onTaptf();
        });
  }

  /// Common widget
  Widget _buildFour({
    required String eightyTwo,
    required String eightyOne,
    required String eighty,
    required String seventyNine,
    required String seventyEight,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 16.v),
        decoration: AppDecoration.outlinePrimary1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder36),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(eightyTwo,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 21.v),
          Text(eightyOne,
              style: CustomTextStyles.bodyMediumNunitoBlack900
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 23.v),
          Text(eighty,
              style: CustomTextStyles.headlineSmallNunitoBlack900
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 20.v),
          Text(seventyNine,
              style: CustomTextStyles.bodyMediumNunitoBlack900
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 25.v),
          Text(seventyEight,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.black900)),
          SizedBox(height: 9.v)
        ]));
  }

  /// Navigates to the specialQuestionsScreen when the action is triggered.
  onTaptf() {
    Get.toNamed(
      AppRoutes.specialQuestionsScreen,
    );
  }
}


class HeightSelector extends StatefulWidget {
  final Function(int) onHeightSelected;
  final int initialHeight;

  HeightSelector({Key? key, required this.onHeightSelected, this.initialHeight = 160}) : super(key: key);

  @override
  _HeightSelectorState createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  late int _selectedHeightIndex;

  @override
  void initState() {
    super.initState();
    _selectedHeightIndex = widget.initialHeight - 50; // Convert initial height to index
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        itemExtent: MediaQuery.of(context).size.height * 0.25 / 3,
        diameterRatio: 1.5,
        perspective: 0.002,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedHeightIndex = index;
            widget.onHeightSelected(50 + index); // Convert index back to height value
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (BuildContext context, int index) {
            final isSelected = index == _selectedHeightIndex;
            return Center(
              child: Text(
                '${50 + index} cm',
                style: TextStyle(
                  fontSize: isSelected ? 24 : 18,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
            );
          },
          childCount: 451, // For heights 50 to 500
        ),
        useMagnifier: true,
        magnification: 1.1,
      ),
    );
  }
}


class WeightSelector extends StatefulWidget {
  final Function(int) onWeightSelected;
  final int initialWeight;

  WeightSelector({Key? key, required this.onWeightSelected, this.initialWeight = 70}) : super(key: key);

  @override
  _WeightSelectorState createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  late int _selectedWeightIndex;

  @override
  void initState() {
    super.initState();
    _selectedWeightIndex = widget.initialWeight; // Weight directly corresponds to index
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        itemExtent: MediaQuery.of(context).size.height * 0.25 / 3,
        diameterRatio: 1.5,
        perspective: 0.002,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedWeightIndex = index;
            widget.onWeightSelected(index); // Weight directly corresponds to index
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (BuildContext context, int index) {
            final isSelected = index == _selectedWeightIndex;
            return Center(
              child: Text(
                '${index} kg',
                style: TextStyle(
                  fontSize: isSelected ? 24 : 18,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
            );
          },
          childCount: 601, // For weights 0 to 600
        ),
        useMagnifier: true,
        magnification: 1.1,
      ),
    );
  }
}

