import 'Constants.dart';


class Endpoints{
  static const String get_all_doctors = "http://${Constants.djangoHost}/Endpoints/All_doctors/";
  static const String get_all_specialties = "http://${Constants.djangoHost}/Endpoints/All_specialties/";
  static const String add_patient = "http://${Constants.djangoHost}/Endpoints/register_user/";
  static const String edit_profile = "http://${Constants.djangoHost}/Endpoints/edit_profile";

}
