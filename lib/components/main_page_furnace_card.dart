import 'package:flutter/material.dart';
import 'package:nonna/enums/categories_enum.dart';
import 'package:nonna/product_detail_screen.dart';
import 'package:nonna/styles.dart';

class MainPageFurnaceCard extends StatefulWidget {
  const MainPageFurnaceCard({
    super.key,
    required this.imagesUrls,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
  });

  final List<Image> imagesUrls;
  final String title;
  final double price;
  final String description;
  final Categories category;

  @override
  State<StatefulWidget> createState() => _MainPageFurnaceCardState();
}

class _MainPageFurnaceCardState extends State<MainPageFurnaceCard> {
  void _onTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProductDetailScreen(
          title: widget.title,
          image: widget.imagesUrls[0],
          price: widget.price,
          description: widget.description,
        ),
      ),
    );
  }

  String _formatDouble(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 6.0,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image(image: widget.imagesUrls[0].image, height: 275, width: double.infinity, fit: BoxFit.cover),
            ),
            Align(
              child: Column(
                spacing: 6.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'Ojuju',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${_formatDouble(widget.price)}€',
                    style: Styles.linkStyle.copyWith(
                      fontSize: 20
                    )
                  ),
                  Text(
                    widget.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.normalText.copyWith(
                      fontSize: 14
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
