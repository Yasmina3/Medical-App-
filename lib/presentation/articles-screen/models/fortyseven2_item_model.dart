import '../../../core/app_export.dart';

/// This class is used in the [fortyseven2_item_widget] screen.
class Fortyseven2ItemModel {
  Fortyseven2ItemModel({
    this.title,
    required this.url,
    this.imageUrl,
    this.id,
  });

  /// The title of the article.
  String? title;

  /// The URL of the article.
  Uri url;

  /// The URL of the image associated with the article.
  String? imageUrl;

  /// The unique identifier of the article.
  String? id;
}