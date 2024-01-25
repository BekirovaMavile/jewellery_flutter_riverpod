import 'package:flutter/material.dart';
import '../data/_data.dart';
import '../ui/_ui.dart';
import 'package:jewellry_shop/data/models/jew.dart';

class JewState {
  JewState._();
  static final _instance = JewState._();
  factory JewState() => _instance;

  //Переменные
  List<JewCategory> categories = AppData.categories;
  List<Jew> jews = AppData.jewItems;
  List<Jew> jewsByCategory = AppData.jewItems;
  List<Jew> get cart => jews.where((element) => element.cart).toList();
  List<Jew> get favorite => jews.where((element) => element.isFavorite).toList();
  ValueNotifier<bool> isLight = ValueNotifier(true);

  Future<void> onCategoryTap(JewCategory selectedCategory) async {
    if (categories.contains(selectedCategory)) {
      for (var category in categories) {
        category.isSelected = (category == selectedCategory);
      }
      if (selectedCategory == categories.first) {
        jewsByCategory = jews;
      } else {
        jewsByCategory = jews.where((jew) => jew.type == selectedCategory.type).toList();
      }
    }
  }

  Future<void> onIncreaseQuantityTap(Jew jew) async {
    jew.quantity++;
  }

  Future<void> onDecreaseQuantityTap(Jew jew) async {
    if (jew.quantity == 1) return;
    jew.quantity--;
  }

  Future<void> onAddToCartTap(Jew jew) async {
    if (!jew.cart) {
      jew.cart = true;
    }
  }

  Future<void> onRemoveFromCartTap(Jew jew) async {
    jew.cart = false;
  }

  Future<void> onCheckOutTap() async {
    for (var jew in jews) {
      jew.cart = false;
    }
  }

  Future<void> onAddRemoveFavoriteTap(Jew jew) async{
    if (favorite.contains(jew)) {
      favorite.remove(jew);
    } else {
      favorite.add(jew);
    }
    jew.isFavorite = !jew.isFavorite;
  }

  void toggleTheme() {
    isLight.value = !isLight.value;
  }

  String jewPrice(Jew jew) {
    double price = 0;
    price = jew.quantity * jew.price;
    return price.toString();
  }

  double get subtotal {
    double subtotal = 0;
    for(var jew in cart) {
      subtotal += jew.quantity * jew.price;
    }
    return subtotal;
  }
}
