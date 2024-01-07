import 'package:flutter/material.dart';
import 'package:jewellry_shop/data/_data.dart';
import 'package:jewellry_shop/states/category/category_state.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryState _state;

  CategoryProvider() : _state = CategoryState.initial(AppData.jewItems, AppData.categories);

  CategoryState get state => _state;

  onCategoryTab(JewCategory category) {
    final List<JewCategory> categories = _state.jewCategories.map((element){
      if (element == category) {
        return category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

    if (category.type == JewType.all) {
      _state = _state.copyWith(jewCategories: categories, jews: AppData.jewItems);
    } else {
      final List<Jew> jews = AppData.jewItems
          .where((item) => item.type == category.type)
          .toList();
      _state = _state.copyWith(jews: jews, jewCategories: categories);
    }
    notifyListeners();
  }
}