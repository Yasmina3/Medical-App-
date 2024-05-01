import '../../../core/app_export.dart';

/// This class is used in the [fortyseven_item_widget] screen.
class FortysevenItemModel {
  FortysevenItemModel({
    this.chardiologist,
    this.chardiologist1,
    this.fortySeven,
    this.mdechezvous,
    this.distance,
    this.drMarcusHorizon,
    this.drMarcusHorizon1,
    this.widget,
    this.chardiologist2,
    this.fortySeven1,
    this.widget1,
    this.eightHundred,
    this.chardiologist3,
    this.id,
  }) {
    chardiologist = chardiologist ?? Rx("Chardiologist");
    chardiologist1 = chardiologist1 ?? Rx(ImageConstant.imgSignal);
    fortySeven = fortySeven ?? Rx("4,7");
    mdechezvous = mdechezvous ?? Rx(ImageConstant.imgLinkedin);
    distance = distance ?? Rx("800m de chez vous");
    drMarcusHorizon = drMarcusHorizon ?? Rx("Dr. Marcus Horizon");
    drMarcusHorizon1 = drMarcusHorizon1 ?? Rx("Dr. Marcus Horizon");
    widget = widget ?? Rx("طبيب نفسي");
    chardiologist2 = chardiologist2 ?? Rx(ImageConstant.imgSignal);
    fortySeven1 = fortySeven1 ?? Rx("4,7");
    widget1 = widget1 ?? Rx(ImageConstant.imgLinkedin);
    eightHundred = eightHundred ?? Rx("يبعد عنك 800م");
    chardiologist3 =
        chardiologist3 ?? Rx(ImageConstant.imgPexelsCedricF111x111);
    id = id ?? Rx("");
  }

  Rx<String>? chardiologist;

  Rx<String>? chardiologist1;

  Rx<String>? fortySeven;

  Rx<String>? mdechezvous;

  Rx<String>? distance;

  Rx<String>? drMarcusHorizon;

  Rx<String>? drMarcusHorizon1;

  Rx<String>? widget;

  Rx<String>? chardiologist2;

  Rx<String>? fortySeven1;

  Rx<String>? widget1;

  Rx<String>? eightHundred;

  Rx<String>? chardiologist3;

  Rx<String>? id;
}
