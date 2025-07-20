import 'package:flutter/material.dart';
import 'package:nonna/components/login_text_field.dart';
import 'package:nonna/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _onRecoverPasswordTap() {
    Navigator.pushNamed(context, '/recover-password');
  }

  void _onCreateAccountTap() {
    Navigator.pushNamed(context, '/create-account');
  }

  void _onLoginPressed() {
    Navigator.popAndPushNamed(context, '/main-page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        minimum: EdgeInsets.all(18.0),
        child: Column(
          spacing: 28,
          children: [
            const SizedBox(height: 80),
            Column(
              spacing: 28,
              children: [
                Image.asset('assets/Logo.png', width: 276),
                SizedBox(
                  width: 256,
                  child: Text(
                    '¡Nos alegra ver que estás de vuelta!',
                    textAlign: TextAlign.center,
                    style: Styles.titleStyle,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 16,
              children: [
                LoginTextField(name: 'Correo*', prefixIcon: Icon(Icons.email)),
                LoginTextField(
                  name: 'Contraseña*',
                  prefixIcon: Icon(Icons.lock),
                  isPasswordField: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      style: Styles.normalText,
                      children: [
                        const TextSpan(text: 'He olvidado mi contraseña '),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: _onRecoverPasswordTap,
                            child: Text('Recuperar', style: Styles.linkStyle),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Image.asset('assets/Login.png')),
            Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _onLoginPressed,
                      style: TextButton.styleFrom(
                        backgroundColor: Styles.primaryColor,
                        minimumSize: const Size(280, 40),
                      ),
                      child: const Text(
                        'Iniciar sesión',
                        style: Styles.buttonText,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: Styles.bottomText,
                        children: [
                          const TextSpan(
                            text: '¿Aún no tienes cuenta? ¡Únete a',
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: GestureDetector(
                              onTap: _onCreateAccountTap,
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
              ),
          ],
        ),
      ),
    );
  }
}
