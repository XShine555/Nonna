import 'package:flutter/material.dart';
import 'package:nonna/data/furnace_card_data.dart';
import 'package:nonna/enums/categories_enum.dart';
import 'package:nonna/components/main_page_furnace_card.dart';
import 'package:nonna/styles.dart';

class FurnacesScreen extends StatefulWidget {
  final List<FurnaceCardData> cardsData;
  final bool isLoading;
  final bool error;
  final VoidCallback onRefresh;
  final VoidCallback onSearchTap;

  const FurnacesScreen({
    super.key,
    required this.cardsData,
    required this.isLoading,
    required this.error,
    required this.onRefresh,
    required this.onSearchTap,
  });

  @override
  State<FurnacesScreen> createState() => _FurnacesScreenState();
}

class _FurnacesScreenState extends State<FurnacesScreen> {
  Categories _currentCategory = Categories.todo;
  List<FurnaceCardData> _showedCardsData = [];

  @override
  void initState() {
    super.initState();
    _filterCards();
  }

  @override
  void didUpdateWidget(covariant FurnacesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cardsData != widget.cardsData) {
      _filterCards();
    }
  }

  void _filterCards() {
    setState(() {
      _showedCardsData = widget.cardsData;
    });
  }

  void _onCategorySelected(Categories category) {
    setState(() {
      _currentCategory = category;
      _showedCardsData = category == Categories.todo
          ? widget.cardsData
          : widget.cardsData
                .where((card) => card.category == category)
                .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 6),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(Categories.values.length, (index) {
                final category = CategoriesExtension.fromIndex(index);
                final isSelected = category == _currentCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: OutlinedButton(
                    onPressed: () => _onCategorySelected(category),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 30),
                      backgroundColor: isSelected
                          ? Styles.semiBlackColor
                          : Colors.transparent,
                      side: const BorderSide(color: Styles.semiBlackColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    child: Text(
                      Categories.values[index].label,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Styles.semiBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Styles.divider,
        ),

        Expanded(
          child: widget.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Styles.primaryColor),
                )
              : widget.error || widget.cardsData.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'No se ha acceder a la lista de muebles.',
                          style: Styles.normalText,
                        ),
                        ElevatedButton(
                          onPressed: widget.onRefresh,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.primaryColor,
                          ),
                          child: const Text(
                            'Reintentar',
                            style: Styles.buttonText,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.separated(
                    itemCount: _showedCardsData.length,
                    separatorBuilder: (_, __) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Styles.divider,
                    ),
                    itemBuilder: (context, index) {
                      final cardData = _showedCardsData[index];
                      return MainPageFurnaceCard(
                        imagesUrls: cardData.imagesUrls.map((url) {
                          if (url.startsWith('http')) {
                            return Image.network(url);
                          } else {
                            return Image.asset(url);
                          }
                        }).toList(),
                        title: cardData.title,
                        price: cardData.price,
                        description: cardData.description,
                        category: cardData.category,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
