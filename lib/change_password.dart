import 'package:flutter/material.dart';
import 'package:nonna/components/login_text_field.dart';
import 'package:nonna/styles.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<StatefulWidget> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.backgroundColor,
        titleSpacing: 0,
        title: Text(
          'Cambiar contraseña',
          style: TextStyle(fontFamily: 'Manrope'),
        ),
        toolbarHeight: 75,
      ),
      backgroundColor: Styles.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            LoginTextField(
              name: 'Contraseña nueva*',
              isPasswordField: true,
              prefixIcon: Icon(Icons.lock),
            ),
            LoginTextField(
              name: 'Confirmar contraseña*',
              isPasswordField: true,
              prefixIcon: Icon(Icons.lock),
            ),
            LoginTextField(
              name: 'Contraseña anterior*',
              isPasswordField: true,
              prefixIcon: Icon(Icons.lock),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 45),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  backgroundColor: Styles.primaryColor,
                  minimumSize: const Size(280, 40),
                ),
                child: const Text('Guardar cambios', style: Styles.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
