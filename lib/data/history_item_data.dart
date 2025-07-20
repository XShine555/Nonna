import 'package:nonna/data/furnace_item_data.dart';
import 'package:nonna/enums/product_state.dart';

class HistoryItemData {
  final String date;
  final String code;
  final double price;
  final ProductState state;
  final List<FurnaceItemData> itemData;

  const HistoryItemData({
    required this.date,
    required this.code,
    required this.price,
    required this.state,
    required this.itemData,
  });
}
