import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/fortyseven_item_widget.dart';
import 'models/fortyseven_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/top_doctor_controller.dart';
import '../home_screen/api.dart';

// ignore_for_file: must_be_immutable
class TopDoctorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'أفضل الأطباء',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder<List<Map<String, dynamic>>?>(
          future: endpoint_api_top_doctors(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) => SizedBox(height: 24.0),
                  itemBuilder: (context, index) {
                    Map<String, dynamic> doctorData = snapshot.data![index];
                    return FortysevenItemWidget(doctorData: doctorData);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 25.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(
          left: 21.h,
          top: 20.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(text: "أفضل الأطباء"),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconChevronLeftGray90024x24,
          margin: EdgeInsets.fromLTRB(32.h, 15.v, 32.h, 16.v),
        ),
      ],
    );
  }
}
