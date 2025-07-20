import 'package:flutter/material.dart';
import 'package:nonna/components/login_text_field.dart';
import 'package:nonna/styles.dart';

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  void _onSendEmailPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Recuperar contraseña'),
        backgroundColor: Color.fromRGBO(243, 243, 233, 1),
      ),
      backgroundColor: Color.fromRGBO(243, 243, 233, 1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 42.0),
        child: Center(
          child: Column(
            spacing: 42.0,
            children: [
              Image.asset('assets/Logo.png', width: 276),
              SizedBox(
                width: 356,
                child: Text(
                  'Introduce tu correo y te enviaremos las instrucciones para poder recuperarla.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Ojuju',
                  ),
                ),
              ),
              LoginTextField(name: 'Correo*', prefixIcon: Icon(Icons.email)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _onSendEmailPressed,
                      style: TextButton.styleFrom(
                        backgroundColor: Styles.primaryColor,
                        minimumSize: Size(280, 40),
                      ),
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
