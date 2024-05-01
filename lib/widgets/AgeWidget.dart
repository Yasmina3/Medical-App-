import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tabibak/presentation/UserController.dart';

class AgeWidget extends StatefulWidget {
  @override
  _AgeWidgetState createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  int _selectedAge = 30; // Initialize with the middle age

  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: _selectedAge);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the height each item should have to fit 3 items in 30% of the screen height
    final double itemHeight = MediaQuery.of(context).size.height * 0.3 / 3;

    return Container(
      height: MediaQuery.of(context).size.height * 0.25, // 30% of screen height
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        itemExtent: itemHeight,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          print("on selected item changed  with index=${index}");
          setState(() {
            print("insdie setstae");
            _selectedAge = index;

            UserController usr = Get.find<UserController>();
            usr.age.value = _selectedAge;

            print("age in widget = ${usr.age}  ");
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (BuildContext context, int index) {
            final bool isSelected = index == _selectedAge;
            return Center(
              child: Text(
                index.toString(),
                style: TextStyle(
                  fontSize: isSelected ? itemHeight * 0.6 : itemHeight * 0.4,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
            );
          },
          childCount: 121, // Age range from 0 to 120
        ),
        useMagnifier: true,
        magnification: 1.1, // Slight magnification for the center item
        diameterRatio: 1.5,
      ),
    );
  }
}
