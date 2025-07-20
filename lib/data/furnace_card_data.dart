import 'package:nonna/enums/categories_enum.dart';

class FurnaceCardData {
  FurnaceCardData({
    required this.imagesUrls,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
  });

  final List<String> imagesUrls;
  final String title;
  final double price;
  final String description;
  final Categories category;
}
