import 'package:flutter/material.dart';
import 'package:nonna/components/main_page_furnace_card.dart';
import 'package:nonna/styles.dart';
import 'package:nonna/data/furnace_card_data.dart';
import 'package:diacritic/diacritic.dart';

class MainScreenSearch extends StatefulWidget {
  const MainScreenSearch({super.key, required this.data});

  final Map<String, dynamic>? data;

  @override
  State<StatefulWidget> createState() => _MainScreenSearchState();
}

class _MainScreenSearchState extends State<MainScreenSearch> {
  final TextEditingController _controller = TextEditingController();
  late final List<FurnaceCardData> _cards = widget.data?['cards'] != null
      ? List<FurnaceCardData>.from(widget.data!['cards'])
      : [];
  List<FurnaceCardData> _showedCardsData = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool containsIgnoringAccents(String source, String query) {
    final normalizedSource = removeDiacritics(source.toLowerCase());
    final normalizedQuery = removeDiacritics(query.toLowerCase());

    return normalizedSource.contains(normalizedQuery);
  }

  void _onTextChanged(String newValue) {
    setState(() {
      if (newValue.trim().isEmpty) {
        _showedCardsData = [];
      } else {
        _showedCardsData = _cards
            .where(
              (cardData) =>
                  removeDiacritics(cardData.title.toLowerCase())
  .contains(removeDiacritics(newValue.toLowerCase()))
            )
            .toList();
      }
    });
  }

  void _onCloseTap() {
    setState(() {
      _controller.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.backgroundColor,
      appBar: AppBar(
        backgroundColor: Styles.backgroundColor,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(color: Styles.semiBlackColor, height: 1.0),
          ),
        ),
        title: TextField(
          controller: _controller,
          onChanged: _onTextChanged,
          style: Styles.normalText,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            hintText: 'Busca por nombre...',
            hintStyle: Styles.normalText,
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: _onCloseTap,
              child: Icon(Icons.close),
            ),
          ),
        ),
      ),
      body: _controller.text.isEmpty || _showedCardsData.isEmpty
          ? Center(
              child: Column(
                spacing: 18,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/flores.png', width: 180),
                  SizedBox(
                    width: 340,
                    child: Text(
                      '¡Encuentra la decoración perfecta para tu hogar!',
                      style: Styles.titleStyle.copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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
    );
  }
}
