import 'package:tabibak/widgets/app_bar/custom_app_bar.dart';
import 'package:tabibak/widgets/app_bar/appbar_leading_image.dart';
import 'package:tabibak/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tabibak/widgets/app_bar/appbar_trailing_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'controller/location_controller.dart';

// ignore_for_file: must_be_immutable
class LocationScreen extends GetWidget<LocationController> {
  LocationScreen({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.img35Location,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            height: 768.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 768.v,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: appTheme.black900.withOpacity(0.05),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildAppBar(),
                      SizedBox(height: 20.v),
                      _buildMap(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 63.v,
      leadingWidth: 25.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgComponent1,
        margin: EdgeInsets.only(
          left: 21.h,
          top: 24.v,
          bottom: 23.v,
        ),
      ),
      title: AppbarSubtitleOne(
        text: "lbl44".tr,
        margin: EdgeInsets.only(left: 111.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconChevronLeftGray90024x24,
          margin: EdgeInsets.fromLTRB(41.h, 24.v, 41.h, 15.v),
        ),
      ],
      styleType: Style.bgShadow,
    );
  }

  /// Section Widget
  Widget _buildMap() {
    return SizedBox(
      height: 658.v,
      width: 355.h,
      child: GoogleMap(
        //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            37.43296265331129,
            -122.08832357078792,
          ),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }
}
