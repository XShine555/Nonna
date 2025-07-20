import 'package:flutter/material.dart';
import 'package:nonna/data/furnace_card_data.dart';
import 'package:nonna/styles.dart';

class CartFuranceItem extends StatefulWidget {
  const CartFuranceItem({
    super.key,
    required this.data,
    required this.onValueUpdate,
  });

  final FurnaceCardData data;
  final ValueChanged<int> onValueUpdate;

  @override
  State<StatefulWidget> createState() => _CartFuranceItemState();
}

class _CartFuranceItemState extends State<CartFuranceItem> {
  int count = 1;

  String _formatDouble(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toString();
  }

  void _minus() {
    if (count > 0) {
      setState(() {
        count--;
      });
      widget.onValueUpdate.call(count);
    }
  }

  void _plus() {
    setState(() {
      count++;
    });
    widget.onValueUpdate.call(count);
  }

  @override
  Widget build(BuildContext context) {
    final image = widget.data.imagesUrls[0];

    return Row(
      children: [
        Row(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image.startsWith('http')
                ? Image.network(
                    image,
                    width: 225,
                    height: 225,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    image,
                    width: 200,
                    height: 225,
                    fit: BoxFit.cover,
                  ),
            SizedBox(
              height: 225,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.title,
                          style: Styles.normalText.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(41, 41, 41, 1),
                          ),
                        ),
                        Text(
                          '${_formatDouble(widget.data.price)}€',
                          style: Styles.normalText.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(41, 41, 41, 1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Styles.linkColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: _minus,
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                ),
                                Text(
                                  count.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                IconButton(
                                  onPressed: _plus,
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        SizedBox(
                          height: 40,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.shopping_cart_checkout_outlined,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
