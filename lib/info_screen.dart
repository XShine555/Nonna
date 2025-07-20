import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nonna/styles.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Styles.backgroundColor,
          appBar: AppBar(
            backgroundColor: Styles.backgroundColor,
            title: Text('Información', style: TextStyle(fontFamily: 'Manrope')),
            titleSpacing: 0,
            toolbarHeight: 75,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 18,
              children: [
                Image.asset('assets/Logo.png', width: 196),
                Text(
                  'Ver 1.0',
                  style: TextStyle(fontFamily: 'Manrope', color: Colors.grey),
                ),
                Text(
                  'En Nonna ofrecemos una selección curada de piezas únicas, que combinan artesania, materiales premium y un estilo atemporal. Desde elegantes sofás y mesas hasta sillas, iluminación y elementos decorativos, cada articulo de Nonna está diseñado para elevar la estética de tus espacios, garantizando durabilidad y confort.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Manrope'),
                ),
                Text(
                  'Ya sea que estés renovando tu sala, comedor o dormitorio. en con nosotros encontrarás muebles sofisticados que se adaptan a tu estilo de vida, con diseños pensados para convertir tu casa en un espacio verdaderamente acogedor y lleno de personalidad.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Manrope'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Icon(FontAwesomeIcons.squareFacebook),
                    Icon(Icons.email),
                    Icon(FontAwesomeIcons.xTwitter),
                    Icon(FontAwesomeIcons.instagram),
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
