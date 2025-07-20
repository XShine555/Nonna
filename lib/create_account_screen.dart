import 'package:flutter/material.dart';
import 'package:nonna/components/login_text_field.dart';
import 'package:nonna/styles.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isChecked = false;

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void _onCreateAccountPressed() {
    Navigator.pop(context);
  }

  void _onLoginPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        minimum: EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 14.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Column(
                  spacing: 28.0,
                  children: [
                    Image.asset('assets/Logo.png', width: 276),
                    SizedBox(
                      width: 356,
                      child: Text(
                        'Te damos la bienvenida a Nonna. ¡Crea tu cuenta!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                child: CircleAvatar(
                  backgroundColor: Styles.inputBackground,
                  minRadius: 80,
                ),
              ),
              LoginTextField(name: 'Nombre y apellidos*'),
              LoginTextField(name: 'Teléfono*', prefixIcon: Icon(Icons.phone)),
              LoginTextField(name: 'Correo*', prefixIcon: Icon(Icons.mail)),
              LoginTextField(
                name: 'Contraseña*',
                prefixIcon: Icon(Icons.lock),
                isPasswordField: true,
              ),
              Column(
                children: [
                  CheckboxListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _isChecked,
                    onChanged: _onCheckboxChanged,
                    title: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Manrope',
                        ),
                        children: [
                          TextSpan(text: 'He leido y acepto los '),
                          TextSpan(
                            text: 'términos y condiciones ',
                            style: TextStyle(
                              color: Styles.linkColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: 'y la '),
                          TextSpan(
                            text: 'política de privacidad',
                            style: TextStyle(
                              color: Styles.linkColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _onCreateAccountPressed,
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.primaryColor,
                      minimumSize: Size(280, 40),
                    ),
                    child: Text(
                      'Crear cuenta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: Styles.bottomText,
                      children: [
                        const TextSpan(text: '¿Ya tienes cuenta? ¡Entra en'),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: _onLoginPressed,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              child: Image.asset(
                                'assets/Logo.png',
                                width: 60,
                                height: 60,
                                color: Styles.linkColor,
                              ),
                            ),
                          ),
                        ),
                        const TextSpan(text: '!'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
