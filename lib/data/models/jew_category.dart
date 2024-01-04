import 'package:jewellry_shop/data/models/jew.dart';

class JewCategory {
  final JewType type;
  bool isSelected;

  JewCategory({required this.type, required this.isSelected});
  JewCategory copyWith({JewType? type, bool? isSelected}) {
    return JewCategory(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}