import 'package:flutter/material.dart';
import 'package:nonna/components/normal_text_field.dart';
import 'package:nonna/styles.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<StatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late final _total = widget.data['total'];

  String _formatDouble(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toString();
  }

  void _onPay() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      appBar: AppBar(
        backgroundColor: Styles.backgroundColor,
        titleSpacing: 0,
        title: Text(
          'Checkout',
          style: TextStyle(fontSize: 20, fontFamily: 'Manrope'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          spacing: 20,
          children: [
            Row(
              spacing: 16,
              children: [
                Icon(Icons.reorder, color: Styles.linkColor),
                Text(
                  'La entrega se realizará en 24-72 h',
                  style: TextStyle(
                    color: Styles.linkColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Ojuju',
                    fontWeight: FontWeight.w700,
                    color: Styles.semiBlackColor,
                  ),
                ),
                Text(
                  "${_formatDouble(_total)}€",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color: Styles.semiBlackColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gastos de envío',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Ojuju',
                    fontWeight: FontWeight.w700,
                    color: Styles.semiBlackColor,
                  ),
                ),
                Text(
                  "10€",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color: Styles.semiBlackColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Ojuju',
                    fontWeight: FontWeight.w700,
                    color: Styles.semiBlackColor,
                  ),
                ),
                Text(
                  "${_formatDouble(_total + 10)}€",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color: Styles.semiBlackColor,
                  ),
                ),
              ],
            ),
            NormalTextField(
              name: 'Dirección de entrega*',
              postfixIcon: Icon(Icons.location_on),
            ),
            NormalTextField(name: 'Teléfono*', prefixIcon: Icon(Icons.phone)),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: TextButton(
                onPressed: _onPay,
                style: TextButton.styleFrom(
                  backgroundColor: Styles.primaryColor,
                  minimumSize: Size(280, 40),
                ),
                child: const Text('Aceptar y pagar', style: Styles.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
