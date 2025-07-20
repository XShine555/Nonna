import 'package:flutter/material.dart';
import 'package:nonna/cart_screen.dart';
import 'package:nonna/enums/categories_enum.dart';
import 'package:nonna/furances_screen.dart';
import 'package:nonna/history_screen.dart';
import 'package:nonna/styles.dart';
import 'package:nonna/data/furnace_card_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomBarIndex = 0;

  List<FurnaceCardData> _cardsData = [];
  bool _isLoading = true;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _error = false;
      _cardsData.clear();
    });

    try {
      final url = Uri.parse('https://testback.apiabalit.com/nonna/nonna.json');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> data = jsonData['data'];

        if (data.isEmpty) {
          setState(() {
            _isLoading = false;
            _error = true;
          });
          return;
        }
        List<FurnaceCardData> cardsTemp = [
          FurnaceCardData(
            imagesUrls: [
              'assets/nonna_img/b72a9fd78825a24f6d0b39820516de7f.png',
            ],
            title: 'Sofá Modular Kori',
            price: 200,
            description:
                'El Sofá Modular Kori redefine la versatilidad y el confort en el mobiliario moderno. Con un diseño modular, permite múltiples configuraciones para adaptarse perfectamente a tu espacio y necesidades. Su tapicería de alta calidad, aporta un toque contemporáneo.',
            category: Categories.sofas,
          ),
        ];

        for (var item in data) {
          List<String> imageUrls = List<String>.from(item['images']);

          cardsTemp.add(
            FurnaceCardData(
              imagesUrls: imageUrls,
              title: item['title'],
              price: item['price'].toDouble(),
              description: item['description'],
              category: CategoriesExtension.fromIndex(item['category']['id']),
            ),
          );
        }

        setState(() {
          _cardsData = cardsTemp;
          _isLoading = false;
          _error = false;
        });
      } else {
        setState(() {
          _error = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = true;
        _isLoading = false;
      });
    }
  }

  void _onBottomBarTap(int index) {
    setState(() {
      _bottomBarIndex = index;
    });
  }

  void _onSearchTap() {
    Navigator.pushNamed(
      context,
      '/main-page-search',
      arguments: {'cards': _cardsData},
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    final bool selected = _bottomBarIndex == index;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: selected
          ? BoxDecoration(
              color: Colors.grey.withAlpha(40),
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: Icon(
        iconData,
        color: selected ? Styles.primaryColor : Colors.grey,
        size: 24,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      FurnacesScreen(
        cardsData: _cardsData,
        isLoading: _isLoading,
        error: _error,
        onRefresh: _fetchData,
        onSearchTap: _onSearchTap,
      ),
      const HistoryScreen(),
      const CartScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.backgroundColor,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              child: CircleAvatar(backgroundColor: Styles.inputBackground),
            ),
            Image.asset('assets/Logo.png', height: 28),
            if (_bottomBarIndex == 0)
              GestureDetector(
                onTap: _onSearchTap,
                child: const Icon(Icons.search_sharp, size: 24),
              )
            else
              const SizedBox(width: 24, height: 24),
          ],
        ),
      ),
      body: IndexedStack(index: _bottomBarIndex, children: pages),
      backgroundColor: Styles.backgroundColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Styles.semiBlackColor, width: 0.25),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: _bottomBarIndex,
            onTap: _onBottomBarTap,
            backgroundColor: Styles.backgroundColor,
            selectedItemColor: Styles.primaryColor,
            unselectedItemColor: Colors.grey,
            unselectedFontSize: 14,
            selectedFontSize: 14,
            iconSize: 24,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.shelves, 0),
                label: 'Muebles',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.receipt_long_outlined, 1),
                label: 'Historial',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.shopping_cart_outlined, 2),
                label: 'Carrito',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
