import 'package:tabibak/presentation/home_screen/models/doctor_item_model.dart';

class HomeModel {
  List<DoctorItemModel> doctors;

  HomeModel({this.doctors = const []});

  // Adjusted to handle JSON list directly
  factory HomeModel.fromJson(List<dynamic> parsedJson) {
    List<DoctorItemModel> doctors = parsedJson.map((i) => DoctorItemModel.fromJson(i as Map<String, dynamic>)).toList();
    return HomeModel(doctors: doctors);
  }
}
