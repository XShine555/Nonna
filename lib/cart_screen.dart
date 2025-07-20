import 'package:flutter/material.dart';
import 'package:nonna/components/cart_furnace_item.dart';
import 'package:nonna/data/furnace_card_data.dart';
import 'package:nonna/enums/categories_enum.dart';
import 'package:nonna/styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String _formatDouble(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toString();
  }

  double _total = 0;

  @override
  void initState() {
    super.initState();
    for (var entry in _items.entries) {
      _total += entry.key.price * entry.value;
    }
  }

  void _onFinishPressed() {
    Navigator.pushNamed(context, '/checkout', arguments: {'total': _total});
  }

  void _updateTotal(FurnaceCardData data, int count) {
    setState(() {
      _items[data] = count;

      double total = 0;
      for (var entry in _items.entries) {
        total += entry.key.price * entry.value;
      }
      _total = total;
    });
  }

  late final Map<FurnaceCardData, int> _items = {
    FurnaceCardData(
      imagesUrls: ['assets/nonna_img/c32f62e9097631585e57f621e9ee981f.png'],
      title: 'Mesa de comedor Boho',
      price: 350,
      description: '',
      category: Categories.todo,
    ): 1,
  };

  @override
  Widget build(BuildContext context) {
    final itemWidgets = _items.entries
        .map(
          (entry) => CartFuranceItem(
            data: entry.key,
            onValueUpdate: (newCount) => _updateTotal(entry.key, newCount),
          ),
        )
        .toList();

    final summaryWidget = Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Styles.divider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(
                  color: Styles.semiBlackColor,
                  fontFamily: 'Ojuju',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                '${_formatDouble(_total)}€',
                style: TextStyle(
                  color: Styles.semiBlackColor,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gastos de envio',
                style: TextStyle(
                  color: Styles.semiBlackColor,
                  fontFamily: 'Ojuju',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                '10€',
                style: TextStyle(
                  color: Styles.semiBlackColor,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: Styles.semiBlackColor,
                  fontFamily: 'Ojuju',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                '${_formatDouble(_total + 10)}€',
                style: TextStyle(
                  color: Styles.semiBlackColor,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [...itemWidgets, summaryWidget],
              ),
            ),
            Container(
              width: 280,
              padding: const EdgeInsets.all(18),
              child: TextButton(
                onPressed: _onFinishPressed,
                style: TextButton.styleFrom(
                  backgroundColor: Styles.primaryColor,
                ),
                child: const Text('Checkout', style: Styles.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
