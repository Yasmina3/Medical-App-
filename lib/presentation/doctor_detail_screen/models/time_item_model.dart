import '../../../core/app_export.dart';

/// This class is used in the [time_item_widget] screen.
class TimeItemModel {
  Rx<String>? am = Rx("09:00 AM");
  Rx<int>? session_id = Rx(1);
  Rx<bool>? isSelected = Rx(false);

}
