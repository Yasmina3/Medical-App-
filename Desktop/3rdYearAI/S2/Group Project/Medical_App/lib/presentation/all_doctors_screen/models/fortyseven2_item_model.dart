import '../../../core/app_export.dart';

/// This class is used in the [fortyseven2_item_widget] screen.
class Fortyseven2ItemModel {
  Fortyseven2ItemModel({
    this.drMarcusHorizon,
    this.widget,
    this.drMarcusHorizon1,
    this.fortySeven,
    this.mdechezvous,
    this.distance,
    this.drMarcusHorizon2,
    this.id,
  }) {
    drMarcusHorizon = drMarcusHorizon ?? Rx("Dr. Marcus Horizon");
    widget = widget ?? Rx("طبيب نفسي");
    drMarcusHorizon1 = drMarcusHorizon1 ?? Rx(ImageConstant.imgSignal);
    fortySeven = fortySeven ?? Rx("4,7");
    mdechezvous = mdechezvous ?? Rx(ImageConstant.imgLinkedin);
    distance = distance ?? Rx("800m de chez vous");
    drMarcusHorizon2 =
        drMarcusHorizon2 ?? Rx(ImageConstant.imgPexelsCedricF111x111);
    id = id ?? Rx("");
  }

  Rx<String>? drMarcusHorizon;

  Rx<String>? widget;

  Rx<String>? drMarcusHorizon1;

  Rx<String>? fortySeven;

  Rx<String>? mdechezvous;

  Rx<String>? distance;

  Rx<String>? drMarcusHorizon2;

  Rx<String>? id;
}
