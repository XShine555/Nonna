import 'package:flutter/material.dart';

class ConfigButton extends StatefulWidget {
  const ConfigButton({
    super.key,
    this.arrowAtEnd = false,
    required this.icon,
    required this.name,
    required this.onPressed,
  });

  final IconData icon;
  final String name;
  final bool arrowAtEnd;
  final GestureTapCallback? onPressed;

  @override
  State<StatefulWidget> createState() => _ConfigButtonState();
}

class _ConfigButtonState extends State<ConfigButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              Icon(widget.icon, color: Colors.grey),
              Text(
                widget.name,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          if (widget.arrowAtEnd)
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
