import 'package:flutter/material.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/presentation/searchresultscreen/models/fortyseven2_item_model.dart';

class Fortyseven2ItemWidget extends StatelessWidget {
  Fortyseven2ItemWidget(
    this.fortyseven2ItemModelObj, {
    Key? key,
    this.onTapDoctor,
    required this.screenSize,
  }) : super(key: key);

  final Fortyseven2ItemModel fortyseven2ItemModelObj;
  final VoidCallback? onTapDoctor;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapDoctor?.call();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10), // Add margin to separate items
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenSize.height * 0.16,
              width: screenSize.width * 0.35,
              child: SingleChildScrollView(
                // Wrap the content in SingleChildScrollView to make it scrollable
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            fortyseven2ItemModelObj.drMarcusHorizon!.value,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(height: 5.v),
                        Padding(
                          padding: EdgeInsets.only(left: 27.h),
                          child: Text(
                            fortyseven2ItemModelObj.widget!.value,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        SizedBox(height: 2.v),
                        Container(
                          height: 18.v,
                          width: 41.h,
                          margin: EdgeInsets.only(left: 29.h),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 18.v,
                                  width: 41.h,
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
                                    imagePath: fortyseven2ItemModelObj
                                        .drMarcusHorizon1!.value,
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
                                    fortyseven2ItemModelObj.fortySeven!.value,
                                    style: CustomTextStyles.labelLargePrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 17.v),
                        SizedBox(height: 10.v),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.16,
              width: screenSize.width * 0.35,
              child: Image.network(
                fortyseven2ItemModelObj.drMarcusHorizon2!.value,
                height: screenSize.height * 0.111,
                width: screenSize.width * 0.111,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
