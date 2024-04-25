import '../../../core/app_export.dart';

/// This class is used in the [headline1_item_widget] screen.
class Headline1ItemModel {
  Headline1ItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
