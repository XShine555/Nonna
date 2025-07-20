import 'package:flutter/material.dart';

enum ProductState { cancelled, sent }

extension ProductStateExtension on ProductState {
  String get label {
    switch (this) {
      case ProductState.cancelled:
        return 'Cancelado';
      case ProductState.sent:
        return 'Enviado';
    }
  }

  Color get color {
    switch (this) {
      case ProductState.cancelled:
        return Colors.red;
      case ProductState.sent:
        return const Color.fromRGBO(61, 93, 82, 1);
    }
  }

  static Color getColor(ProductState type) {
    return type.color;
  }

  static String getLabel(ProductState type) {
    return type.label;
  }

  static ProductState fromIndex(int index) {
    return ProductState.values[index];
  }
}

