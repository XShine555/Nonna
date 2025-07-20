import 'package:flutter/material.dart';
import 'package:nonna/change_password.dart';
import 'package:nonna/checkout_screen.dart';
import 'package:nonna/config_screen.dart';
import 'package:nonna/create_account_screen.dart';
import 'package:nonna/edit_profile.dart';
import 'package:nonna/history_item_details.dart';
import 'package:nonna/info_screen.dart';
import 'package:nonna/login_screen.dart';
import 'package:nonna/main-page-search.dart';
import 'package:nonna/main_screen.dart';
import 'package:nonna/profile_screen.dart';
import 'package:nonna/recover_password_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nonna',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/recover-password': (context) => const RecoverPasswordScreen(),
        '/create-account': (context) => const CreateAccountScreen(),
        '/main-page': (context) => const MainScreen(),
        '/main-page-search': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is Map<String, dynamic>) {
            return MainScreenSearch(data: args);
          } else {
            throw Exception('Invalid params in MainScreenSearch');
          }
        },
        '/history-details': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is Map<String, dynamic>) {
            return HistoryItemDetails(data: args);
          } else {
            throw Exception('Invalid params in HistoryItemDetails');
          }
        },
        '/checkout': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is Map<String, dynamic>) {
            return CheckoutScreen(data: args);
          } else {
            throw Exception('Invalid params in Checkout');
          }
        },
        '/profile': (context) => const ProfileScreen(),
        '/config': (context) => const ConfigScreen(),
        '/edit-profile': (context) => const EditProfile(),
        '/change-password': (context) => const ChangePassword(),
        '/info-screen': (context) => const InfoScreen(),
      },
    );
  }
}
