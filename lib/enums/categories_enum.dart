enum Categories {
    todo,
    sofas,
    sillas,
    lamparas,
    armarios,
}

extension CategoriesExtension on Categories {
  String get label {
    switch (this) {
      case Categories.todo:
        return 'Todo';
      case Categories.sofas:
        return 'Sofás';
      case Categories.sillas:
        return 'Sillas';
      case Categories.lamparas:
        return 'Lámparas';
      case Categories.armarios:
        return 'Armarios';
    }
  }

  static Categories fromIndex(int index) {
    return Categories.values[index];
  }
}