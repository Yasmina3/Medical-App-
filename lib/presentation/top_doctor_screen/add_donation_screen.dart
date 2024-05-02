import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabibak/core/app_export.dart';
import 'package:tabibak/widgets/custom_text_form_field.dart';
import 'package:tabibak/widgets/custom_elevated_button.dart';
import 'package:tabibak/widgets/custom_outlined_button.dart';
import 'api.dart';


class AddDonationScreen extends StatefulWidget {
  @override
  _AddDonationScreenState createState() => _AddDonationScreenState();
}

class _AddDonationScreenState extends State<AddDonationScreen> {
  TextEditingController donationTitleController = TextEditingController();
  TextEditingController donationNameController = TextEditingController();
  TextEditingController donationDescriptionController = TextEditingController();
  TextEditingController patientNameController = TextEditingController();
  TextEditingController patientPhoneNumberController = TextEditingController();
  TextEditingController patientWilayaController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة تبرع'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: donationNameController,
                hintText: 'اسم التبرع',
                hintStyle: theme.textTheme.bodyLarge,
                contentPadding: EdgeInsets.only(left: 30.h, top: 11.v, bottom: 11.v),
              ),
              CustomTextFormField(
                controller: donationTitleController,
                hintText: 'عنوان التبرع',
                hintStyle: theme.textTheme.bodyLarge,
                contentPadding: EdgeInsets.only(left: 30.h, top: 11.v, bottom: 11.v),
              ),
              SizedBox(height: 16.v),
              CustomTextFormField(
                controller: donationDescriptionController,
                hintText: 'وصف التبرع',
                hintStyle: theme.textTheme.bodyLarge,
                contentPadding: EdgeInsets.only(left: 30.h, top: 11.v, bottom: 11.v),
              ),
              SizedBox(height: 16.v),
              CustomTextFormField(
                controller: patientPhoneNumberController,
                hintText: 'رقم الهاتف',
                hintStyle: theme.textTheme.bodyLarge,
                keyboardType: TextInputType.phone,
                contentPadding: EdgeInsets.only(left: 30.h, top: 11.v, bottom: 11.v),
              ),
              SizedBox(height: 16.v),
              CustomTextFormField(
                controller: patientWilayaController,
                hintText: 'الولاية',
                hintStyle: theme.textTheme.bodyLarge,
                contentPadding: EdgeInsets.only(left: 30.h, top: 11.v, bottom: 11.v),
              ),
              SizedBox(height: 16.v),
              _image != null
                  ? Image.file(
                _image!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
                  : Container(),
              SizedBox(height: 16.v),
              CustomElevatedButton(
                text: 'اختر صورة التبرع',
                onPressed: getImage,
                buttonTextStyle: CustomTextStyles.titleMediumOnPrimary_1,
                contentPadding: EdgeInsets.symmetric(vertical: 16.v),
              ),
              SizedBox(height: 32.v),
              Center(
                child: CustomElevatedButton(
                  text: 'حفظ التبرع',
                  onPressed: () {
                    // Add your logic to save the donation information here
                    addDonation(
                      donationDescriptionController.text,
                      donationTitleController.text,
                      _image!.path,
                      patientWilayaController.text,
                      patientPhoneNumberController.text,
                      2,
                    );
                  },
                  buttonTextStyle: CustomTextStyles.titleMediumOnPrimary_1,
                  contentPadding: EdgeInsets.symmetric(vertical: 16.v),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final EdgeInsets? contentPadding;

  CustomTextFormField({
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.keyboardType,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: contentPadding,
      ),
      keyboardType: keyboardType,
    );
  }
}
class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? buttonTextStyle;
  final EdgeInsets? contentPadding;

  CustomElevatedButton({
    required this.text,
    required this.onPressed,
    this.buttonTextStyle,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: buttonTextStyle,
      ),
      style: ElevatedButton.styleFrom(
        padding: contentPadding,
      ),
    );
  }
}
