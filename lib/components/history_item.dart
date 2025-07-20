import 'package:flutter/material.dart';
import 'package:nonna/data/history_item_data.dart';
import 'package:nonna/enums/product_state.dart';
import 'package:nonna/styles.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.data});

  final HistoryItemData data;

  String _formatDouble(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toString();
  }

  void _onTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/history-details',
      arguments: {'history-info': data},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Column(
        spacing: 12,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.date,
                  style: Styles.normalText.copyWith(fontSize: 14),
                ),
                Text(
                  data.code,
                  style: const TextStyle(
                    fontFamily: 'Manrope',
                    color: Styles.semiBlackColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_formatDouble(data.price)}€',
                  style: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 24,
                    color: Styles.semiBlackColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: data.state.color,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                    child: Text(
                      data.state.label,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 0.5,
                children: data.itemData.map((itemData) {
                  if (itemData.image.startsWith('http')) {
                    return Image.network(
                      itemData.image,
                      width: 225,
                      height: 225,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return Image.asset(
                      itemData.image,
                      width: 225,
                      height: 225,
                      fit: BoxFit.cover,
                    );
                  }
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
