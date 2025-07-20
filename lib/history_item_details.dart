import 'package:flutter/material.dart';
import 'package:nonna/data/furnace_item_data.dart';
import 'package:nonna/enums/product_state.dart';
import 'package:nonna/styles.dart';

class HistoryItemDetails extends StatefulWidget {
  const HistoryItemDetails({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<StatefulWidget> createState() => _HistoryItemDetailsState();
}

class _HistoryItemDetailsState extends State<HistoryItemDetails> {
  late final info = widget.data['history-info'];
  late final List<FurnaceItemData> itemsData = info.itemData;

  String _formatDouble(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toString();
  }

  late final List<Widget> _items = [
    Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
      child: Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Número',
                style: Styles.normalText.copyWith(
                  fontSize: 20,
                  color: Styles.semiBlackColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                info.code,
                style: Styles.normalText.copyWith(
                  fontSize: 20,
                  color: Styles.semiBlackColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fecha',
                style: Styles.normalText.copyWith(
                  fontSize: 20,
                  color: Styles.semiBlackColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                info.date,
                style: Styles.normalText.copyWith(
                  fontSize: 20,
                  color: Styles.semiBlackColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Precio',
                style: Styles.normalText.copyWith(
                  fontSize: 20,
                  color: Styles.semiBlackColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                '${_formatDouble(info.price)}€',
                style: Styles.normalText.copyWith(
                  fontSize: 20,
                  color: Styles.semiBlackColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Estado',
                style: Styles.normalText.copyWith(
                  fontSize: 20,
                  color: Styles.semiBlackColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: ProductStateExtension.getColor(info.state),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Text(
                    ProductStateExtension.getLabel(info.state),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    ...itemsData.map(
      (item) => Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item.image.startsWith('http')
              ? Image.network(
                  item.image,
                  width: 225,
                  height: 225,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  item.image,
                  width: 200,
                  height: 225,
                  fit: BoxFit.cover,
                ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  item.name,
                  style: Styles.normalText.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(41, 41, 41, 1),
                  ),
                ),
                Text(
                  '${_formatDouble(item.price)}€',
                  style: Styles.normalText.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(41, 41, 41, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.backgroundColor,
      appBar: AppBar(backgroundColor: Styles.backgroundColor),
      body: ListView.builder(
        itemBuilder: (context, index) => _items[index],
        itemCount: _items.length,
      ),
    );
  }
}
