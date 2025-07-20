import 'package:flutter/material.dart';
import 'package:nonna/components/normal_text_field.dart';
import 'package:nonna/styles.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<StatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.backgroundColor,
        titleSpacing: 0,
        title: Text('Editar perfil', style: TextStyle(fontFamily: 'Manrope')),
      ),
      backgroundColor: Styles.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          children: [
            CircleAvatar(
              backgroundColor: Styles.inputBackground,
              minRadius: 80,
            ),
            NormalTextField(name: 'Nombre y apellidos*'),
            NormalTextField(name: 'Teléfono*'),
            NormalTextField(name: 'Correo*'),
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
