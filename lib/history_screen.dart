import 'package:flutter/material.dart';
import 'package:nonna/components/history_item.dart';
import 'package:nonna/data/furnace_item_data.dart';
import 'package:nonna/data/history_item_data.dart';
import 'package:nonna/enums/product_state.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  final List<HistoryItemData> _items = const [
    HistoryItemData(
      date: '10 de octubre, 2024',
      code: '#WUQ175291',
      price: 428.53,
      state: ProductState.sent,
      itemData: [
        FurnaceItemData(name: 'Mueble de vinilos', price: 200, image: 'assets/nonna_img/031d8ae66e3745ae2952b37522e5e211.png'),
        FurnaceItemData(name: 'Silla contemporánea', price: 228.53, image: 'assets/nonna_img/1bb04977affc32f923bef798d80b17be.png'),
      ],
    ),
    HistoryItemData(
      date: '10 de octubre, 2024',
      code: '#WUQ175291',
      price: 289.99,
      state: ProductState.sent,
      itemData: [
        FurnaceItemData(name: 'Mesa', price: 289.99, image: 'assets/nonna_img/cfc068ee53919ac305442f491d8c92b0.png')
      ],
    ),
    HistoryItemData(
      date: '10 de octubre, 2024',
      code: '#WUQ175291',
      price: 108.53,
      state: ProductState.sent,
      itemData: [
        FurnaceItemData(name: 'Mesa', price: 108.53, image: 'assets/nonna_img/c32f62e9097631585e57f621e9ee981f.png')
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final itemData = _items[index];
        return HistoryItem(data: itemData);
      },
    );
  }
}
