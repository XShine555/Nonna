import 'package:flutter/material.dart';

abstract class Styles {
  static const Color backgroundColor = Color.fromRGBO(243, 243, 233, 1);
  static const Color inputBackground = Color.fromRGBO(233, 233, 222, 1);
  static const Color primaryColor = Color.fromRGBO(161, 28, 83, 1);
  static const Color linkColor = Color.fromRGBO(92, 118, 107, 1);
  static const Color semiBlackColor = Color.fromRGBO(34, 34, 34, 1);

  static const TextStyle titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w200,
    fontFamily: 'Manrope',
  );

  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Manrope',
  );

  static const TextStyle normalText = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle linkStyle = TextStyle(
    color: linkColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const TextStyle bottomText = TextStyle(
    color: Colors.black,
    fontSize: 17.0,
    fontWeight: FontWeight.w300,
    fontFamily: 'Manrope',
  );

  static const Divider divider = Divider(
    color: semiBlackColor,
  );
}