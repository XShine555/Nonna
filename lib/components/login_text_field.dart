import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.name,
    this.prefixIcon,
    this.isPasswordField = false,
  });

  final String name;
  final Icon? prefixIcon;
  final bool isPasswordField;

  @override
  State<StatefulWidget> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isObscured = false;

  void _toggleRevealPassword() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(233, 233, 222, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: TextField(
        focusNode: _focusNode,
        obscureText: _isObscured,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.0,
            vertical: 8.0
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPasswordField
              ? GestureDetector(
                  onTap: _toggleRevealPassword,
                  child: _isObscured
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                )
              : null,
          label: Text(
            widget.name,
            style: TextStyle(
              color: _isFocused ? Color.fromRGBO(161, 28, 83, 1) : Colors.grey,
            ),
          ),
          prefixIconColor: _isFocused
              ? Color.fromRGBO(161, 28, 83, 1)
              : Colors.grey,
          suffixIconColor: _isFocused
              ? Color.fromRGBO(161, 28, 83, 1)
              : Colors.grey,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(161, 28, 83, 1),
              width: 1.75,
            ),
          ),
        ),
      ),
    );
  }
}
