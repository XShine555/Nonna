import 'package:flutter/material.dart';
import 'package:nonna/components/config_button.dart';
import 'package:nonna/styles.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.backgroundColor,
        toolbarHeight: 75,
        titleSpacing: 0,
        title: Text('Ajustes', style: TextStyle(fontFamily: 'Manrope')),
      ),
      backgroundColor: Styles.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Text(
                  'ACCIONES',
                  style: TextStyle(color: Styles.semiBlackColor),
                ),
                ConfigButton(
                  icon: Icons.edit,
                  name: 'Editar perfil',
                  onPressed: () =>
                      Navigator.pushNamed(context, '/edit-profile'),
                  arrowAtEnd: true,
                ),
                ConfigButton(
                  icon: Icons.lock,
                  name: 'Cambiar contraseña',
                  onPressed: () =>
                      Navigator.pushNamed(context, '/change-password'),
                  arrowAtEnd: true,
                ),
                ConfigButton(
                  icon: Icons.delete,
                  name: 'Eliminar datos',
                  onPressed: null,
                ),
                ConfigButton(
                  icon: Icons.exit_to_app,
                  name: 'Cerrar sesión',
                  onPressed: null,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Text('SOPORTE', style: TextStyle(color: Styles.semiBlackColor)),
                ConfigButton(
                  icon: Icons.info,
                  name: 'Información',
                  onPressed: () => Navigator.pushNamed(context, '/info-screen'),
                  arrowAtEnd: true,
                ),
                ConfigButton(
                  icon: Icons.shield,
                  name: 'Política de privacidad',
                  onPressed: null,
                  arrowAtEnd: true,
                ),
                ConfigButton(
                  icon: Icons.shield,
                  name: 'Términos y condiciones',
                  onPressed: null,
                  arrowAtEnd: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
