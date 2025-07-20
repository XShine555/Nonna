import 'package:flutter/material.dart';
import 'package:nonna/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _onConfigTap() {
    Navigator.pushNamed(context, '/config');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Styles.backgroundColor,
          appBar: AppBar(
            backgroundColor: Styles.backgroundColor,
            centerTitle: true,
            toolbarHeight: 75,
            title: Image.asset('assets/Logo.png', height: 28),
            actions: [
              IconButton(onPressed: _onConfigTap, icon: Icon(Icons.settings)),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              spacing: 20,
              children: [
                CircleAvatar(
                  backgroundColor: Styles.inputBackground,
                  minRadius: 80,
                ),
                Center(
                  child: Text(
                    'Hola, User.',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Ojuju',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.email, color: Styles.linkColor),
                        Text(
                          'Correo',
                          style: TextStyle(color: Styles.linkColor),
                        ),
                      ],
                    ),
                    Text(
                      'ejemplo@mail.com',
                      style: TextStyle(fontFamily: 'Manrope'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.phone, color: Styles.linkColor),
                        Text(
                          'Teléfono',
                          style: TextStyle(color: Styles.linkColor),
                        ),
                      ],
                    ),
                    Text(
                      '602 71 52 81',
                      style: TextStyle(fontFamily: 'Manrope'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            ignoring: true,
            child: Image.asset('assets/Perfil.png'),
          ),
        ),
      ],
    );
  }
}
