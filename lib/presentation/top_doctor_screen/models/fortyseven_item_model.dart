import '../../../core/app_export.dart';

class FortysevenItemModel {
  FortysevenItemModel({

    this.drMarcusHorizon1, //the name
    this.widget, // the discription
    this.chardiologist3, // the image
    this.phonenumber, //the phone number
    this.wilaya, //the wilaya
  }) {
    drMarcusHorizon1 = drMarcusHorizon1 ?? Rx("كرسي متحرك");
    widget = widget ?? Rx("نقدم لكم كرسي متحرك عالي الجودة مصمم خصيصًا لتقديم الدعم والراحة لأولئك الذين يحتاجون إليه. هذا الكرسي متين وسهل الاستخدام، مما يجعله خيارًا مثاليًا للأشخاص ذوي الاحتياجات الخاصة.");
    chardiologist3 =
        chardiologist3 ?? Rx(ImageConstant.imgPexelsCedricF111x111);
    phonenumber = phonenumber ?? Rx("0798502905");
    wilaya = wilaya ?? Rx("Alger");
  }

  Rx<String>? drMarcusHorizon1;
  Rx<String>? widget;
  Rx<String>? chardiologist3;
  Rx<String>? phonenumber;
  Rx<String>? wilaya;
}
