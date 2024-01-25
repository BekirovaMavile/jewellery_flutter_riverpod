import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewellry_shop/states/shared/shared_state.dart';
import 'package:jewellry_shop/ui_kit/app_theme.dart';
import '../../data/_data.dart';


class SharedNotifier extends StateNotifier<SharedState> {
  SharedNotifier(): super(SharedState.initial());

// Здесь будут методы преобразования state
  Future<void> onCategoryTap(JewCategory category) async {
    final categories = state.categories.map((e) {
      if (e.type == category.type) {
        return e.copyWith(isSelected: true);
      } else {
        return e.copyWith(isSelected: false);
      }
    }).toList();

    if (category.type == JewType.all) {
      final jewsByCategory = state.jews;
      state = state.copyWith(categories: categories, jewsByCategory: jewsByCategory);
    } else {
      final jewsByCategory = state.jews.where((e) => e.type == category.type).toList();
      state = state.copyWith(categories: categories, jewsByCategory: jewsByCategory);
    }
  }
  Future<void> onIncreaseQuantityTap(int jewId) async {
    state = state.copyWith(
      jews: state.jews.map((e) {
        if (e.id == jewId) {
          return e.copyWith(quantity: e.quantity + 1);
        } else {
          return e;
        }
      }).toList(),
    );
  }

  Future<void> onDecreaseQuantityTap(int jewId) async {
    state = state.copyWith(
      jews: state.jews.map((e) {
        if (e.id == jewId) {
          return e.quantity == 1 ? e : e.copyWith(quantity: e.quantity - 1);
        } else {
          return e;
        }
      }).toList(),
    );
  }

  Future<void> addToCart(Jew jew) async{
    final List<Jew> updatedJewList = state.jews.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(cart: true, quantity: (element.quantity ?? 0));
      }
      return element;
    }).toList();

    state = state.copyWith(jews: updatedJewList);
  }

  deleteFromCart(Jew jew){
    final List<Jew> cartList = state.jews.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(cart:false);
      }
      return element;
    }).toList();
    state = state.copyWith(jews: cartList);
  }

  isFavoriteTab(Jew jew){
    int index = state.jews.indexWhere((element) => element.id == jew.id);
    final List<Jew> jewList = state.jews.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(isFavorite: !state.jews[index].isFavorite);
      }
      return element;
    }).toList();
    state = state.copyWith(jews: jewList);
  }

  void cleanCart(){
    final List<Jew> cartList = state.jews.map((element) {
      return element.copyWith(cart:false);
    }).toList();
    state = state.copyWith(jews: cartList);
  }

  void toggleTheme() {
    state.isLight.value = !state.isLight.value;
  }


  String priceJew(Jew jew){
    double price = 0;
    price = jew.quantity * jew.price;
    return price.toString();
  }

  double get subtotalPrice{
    double subtotal = 0;
    for (var element in state.jews){
      if (element.cart){
        subtotal += element.quantity * element.price;
      }
    }
    return subtotal;
  }

}