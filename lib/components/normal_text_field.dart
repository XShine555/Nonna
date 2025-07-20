import 'package:flutter/material.dart';

class NormalTextField extends StatefulWidget {
  const NormalTextField({
    super.key,
    required this.name,
    this.prefixIcon,
    this.postfixIcon,
  });

  final String name;
  final Icon? prefixIcon;
  final Icon? postfixIcon;

  @override
  State<StatefulWidget> createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

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
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.0,
            vertical: 8.0
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.postfixIcon,
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
