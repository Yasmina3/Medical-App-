import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import '../UserController.dart';
import 'models/time_item_model.dart';
import '../doctor_detail_screen/widgets/time_item_widget.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/doctor_detail_controller.dart';
import 'package:translator/translator.dart';
// ignore_for_file: must_be_immutable
class DoctorDetailScreen extends GetWidget<DoctorDetailController> {
  DoctorDetailScreen({Key? key})
      : super(
    key: key,
  );

  List<DateTime> dateTimeList = [
    DateTime(2024, 4, 26, 18, 0), // April 26, 2024 at 6:00 PM
    DateTime(2024, 4, 27, 10, 0), // April 27, 2024 at 10:00 AM
    // Add more DateTime objects as needed
  ];
  final translator = GoogleTranslator();
  var Selected = RxInt(1);
  var list_days = [];
  var choosen = 1;

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());

    List<Map<String, dynamic>> sessionList = [
      {
        'session_id': 1,
        'session_time': '2024-04-26T18:00:00Z',
        'doctor_id_id': 2,
        'state': 'not_reserved'
      },
      {
        'session_id': 2,
        'session_time': '2024-04-27T10:00:00Z',
        'doctor_id_id': 3,
        'state': 'reserved'
      },
      // Add more sessions as needed
    ];



    return Scaffold(
      appBar: _buildAppBar(context),
      body: FutureBuilder<dynamic>(
        future: controller.fetchFromDetails(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error in future builder: ${snapshot.error}'));
          } else {
            var data = snapshot.data;
            print(data);
            var doctorInfosList = data["doctor_info"];
// Assuming there's only one item in the list, extract the first item
            var doctorInfo = doctorInfosList[0];

// Access values from the doctorInfo map
            var fullName = doctorInfo["full_name"];
            var specialty = doctorInfo["specialty_name"];
            var location = doctorInfo["location"];
            var description = doctorInfo["description"];
            var sessions_list = data["session_list"];
            print("session list=$sessions_list");
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 31.v),
                child: Column(
                  children: [
                    _buildWidget(fullName,specialty,location),
                    SizedBox(height: 25.v),
                    _buildDescription(description),
                    SizedBox(height: 25.v),
                    _build_time_calendar(sessions_list),
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: _buildTf(),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgTelevision,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "lbl54".tr,
      ),
      actions: [
        GestureDetector(
          onTap: () {

          },
          child: GestureDetector(
            onTap: (){
              print("im here");
              // Navigate back to the previous page
              Get.toNamed(AppRoutes.homeScreen);
            },
            child: AppbarTrailingImage(
              imagePath: ImageConstant.imgArrowRight,
              margin: EdgeInsets.fromLTRB(28.h, 18.v, 28.h, 14.v),
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildWidget(full_name,specialty,location) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          child: Stack(alignment: Alignment.topCenter, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      full_name,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                     specialty,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 10.v),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(left: 18.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgLinkedin,
                                  height: 13.adaptSize,
                                  width: 13.adaptSize,
                                  margin: EdgeInsets.only(bottom: 1.v),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3.h),
                                  child: Text(
                                    location,
                                    style: theme.textTheme.labelMedium,// location
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 18.v,
                          width: 41.h,
                          margin: EdgeInsets.only(left: 18.h),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 18.v,
                                  width: 20.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.h,
                                    vertical: 2.v,
                                  ),
                                  decoration:
                                  AppDecoration.fillBlueGray.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.roundedBorder3,
                                  ),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgSignal,
                                    height: 13.adaptSize,
                                    width: 13.adaptSize,
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 3.h),
                                  child: Text(
                                    "lbl_4_7".tr,
                                    style: CustomTextStyles.labelLargePrimary,
                                  ),
                                ),
                              ),
                              SizedBox(height: 11.v),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.v,
              ),
              CustomImageView(
                  imagePath: ImageConstant.imgPexelsCedricF115x115,
                  height: 120.adaptSize,
                  width: 120.adaptSize,
                  radius: BorderRadius.circular(
                    8.h,
                  )),
              SizedBox(
                width: 20,
              )
            ]),
          ]),
        ));
  }

  Widget _buildDescription(description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Spacer(),
              Text(
                "lbl55".tr,
                style: CustomTextStyles.titleMedium16,
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            description,
            // Arabic description for the doctor
            style: theme.textTheme.bodyLarge,
// Right-to-left text direction
          ),
        ],
      ),
    );
  }

  Widget _build_time_calendar(session_list){
    return Column(
      children: [
        _buildCalendar(session_list),
        SizedBox(height: 30.h),
        _buildTime(session_list),
      ],
    );
  }



// Modify your _buildCalendar function
  Widget _buildCalendar(session_list) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 21.h),
        child: IntrinsicWidth(
          child: SizedBox(
            height: 100.v,
            width: 354.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: session_list.length,
              itemBuilder: (context, index) {
                var session = session_list[index]["session_time"];
                DateTime dateTime = DateTime.parse(session);

                // Extract individual components
                int day = dateTime.day;
                String dayName = DateFormat('EEEE').format(dateTime);

                // Check if the day exists in list_days
                if (list_days.contains(day)) {
                  // If the day exists, return an empty SizedBox
                  return SizedBox( height: 0,width: 0,);
                } else {
                  // If the day doesn't exist, add it to list_days
                  list_days.add(day);

                  // Return the date widget
                  return Obx(() => date_widget(
                    context,
                    day, // Extract day from currentDate
                    dayName, // Extract day name from currentDate
                    dateTime.month, // Extract month name from currentDate
                    dateTime,
                    controller.selectedDate.value == index, // Check if currentDate is selected
                    index,
                    dateTime,
                    session_list,
                  ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }


  List<DateTime> get_slots_per_day(int day, List<dynamic> session_list) {
    // Filter sessions happening on the provided day
    List<dynamic> sessionsOnDay = session_list.where((session) {
      // Extract the day part from the session_time string
      int sessionDay = int.parse(session['session_time'].substring(8, 10));
      // Check if the session day matches the provided day
      return sessionDay == day;
    }).toList();

    // Extract the hour and minutes from each session and convert to a DateTime object
    List<DateTime> slotsTime = sessionsOnDay.map((session) {
      String sessionTime = session['session_time'];
      int year = int.parse(sessionTime.substring(0, 4));
      int month = int.parse(sessionTime.substring(5, 7));
      int day = int.parse(sessionTime.substring(8, 10));
      int hour = int.parse(sessionTime.substring(11, 13));
      int minutes = int.parse(sessionTime.substring(14, 16));
      return DateTime(year, month, day, hour, minutes);
    }).toList();

    return slotsTime;
  }


  Widget date_widget(context, dayNumber, dayName, monthName, fullDate,
      isSelected,index,session_time,session_list){
    return GestureDetector(
      onTap: (){

        print("selected val =  ${controller.selectedDate.value}");
        controller.selectedDate.update((val) {
          controller.selectedDate.value = index;

          print("day is ${session_time.day}");
          int day = session_time.day;

          List<DateTime> sessions_per_day = get_slots_per_day(day,session_list);

          print("sessions per day = ${sessions_per_day}");




         controller.doctorDetailModelObj.update((val) {
           controller.doctorDetailModelObj.value.Sessions_per_day.value= sessions_per_day;
         });





        });


      },
      child: Padding(
        padding: EdgeInsets.only(right: 10.v),
        child: Container(
          width: 80,
          padding: EdgeInsets.symmetric(
            horizontal: 11.h,
            vertical: 15.v,
          ),
          decoration: BoxDecoration(
            color: controller.selectedDate.value==index ?  theme.colorScheme.primary : Colors.grey,
            borderRadius: BorderRadius.circular(
              15.h,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Text(
                  dayName.toString(),
                  style: CustomTextStyles.bodySmallInterOnPrimary
                      .copyWith(
                    color: theme.colorScheme.onPrimary
                        .withOpacity(1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.v),
                child: Text(
                  dayNumber.toString(),
                  style: CustomTextStyles.titleMediumOnPrimary_1
                      .copyWith(
                    color: theme.colorScheme.onPrimary
                        .withOpacity(1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  int getSessionId(var sessionList, DateTime sessionTime) {
    // Loop through the session list
    for (var session in sessionList) {
      // Extract session time from the session map
      String sessionTimeString = session['session_time'];
      // Parse session time string with different format
      DateTime sessionDateTime = DateTime.parse(sessionTimeString.replaceAll("T", " ").replaceAll("Z", ""));

      print("datetime = $sessionDateTime & sesiion_datetime=$sessionTime");

      // Compare session time with sessionTime
      if (sessionDateTime.isAtSameMomentAs(sessionTime)) {
        // Return session ID if found
        return session['session_id'];
      }
    }
    // Return 0 if session not found
    return 0;
  }


  /// Section Widget
  Widget _buildTime(session_list) {
    return Obx(() {
      return Container(
        width: 500.v,
        child: Center(
          child: Wrap(
            runSpacing: 13.v,
            spacing: 13.h,
            children: List<Widget>.generate(
              controller.doctorDetailModelObj.value.Sessions_per_day.length,
                  (index) {
                var session_time = controller.doctorDetailModelObj.value.Sessions_per_day.value[index];
                var time = "${session_time.hour} : ${session_time.minute}";

                TimeItemModel model = TimeItemModel();

                int session_id = getSessionId(session_list,session_time);

                print("session is like with session_id=${session_id}");
                model.am = Rx(time);
                model.session_id = Rx(session_id);
                return TimeItemWidget(
                  model,
                );
              },
            ),
          ),
        ),
      );
    });
  }


  /// Section Widget

  Widget _buildTf() {
    return CustomElevatedButton(
      onPressed: () {
        int session_id = Get.find<UserController>().selected_Slot.value;
        int patient_id = 1;

        print("session_id = ${session_id}");

        // Create the POST request
        http.post(
          Uri.parse('http://10.0.2.2:8000/Endpoints/add_reservation/'),
          body: {
            'session_id': session_id.toString(),
            'patient_id': patient_id.toString(),
          },
        ).then((response) {
          if (response.statusCode == 200) {
            // Handle success response
            print('Reservation added successfully');
          } else {
            // Handle error response
            print('Failed to add reservation. Status code: ${response.statusCode}');
          }
        }).catchError((error) {
          // Handle error
          print('Error adding reservation: $error');
        });
      },
      height: 50.v,
      text: "lbl56".tr,
      margin: EdgeInsets.only(
        left: 55.h,
        right: 54.h,
        bottom: 36.v,
      ),
      buttonStyle: CustomButtonStyles.fillPrimaryTL25,
    );
  }

}
