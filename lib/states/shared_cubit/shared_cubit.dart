import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/_data.dart';
part 'shared_state.dart';

class SharedCubit extends Cubit<SharedState> {
  SharedCubit() : super(SharedState.initial());

  void onCategoryTap(JewCategory category){
    final List<JewCategory> categories = state.categories.map((e) {
      if (e.type == category.type) {
        return e.copyWith(isSelected: true);
      } else {
        return e.copyWith(isSelected: false);
      }
    }).toList();
    if (category.type == JewType.all) {
      emit(state.copyWith(categories: categories, jewsByCategory: state.jews));
    } else {
      final List<Jew> jewsByCategory = state.jews
          .where((e) => e.type == category.type)
          .toList();
      emit(state.copyWith(categories: categories, jewsByCategory: jewsByCategory));
    }
  }


  void onIncreaseQuantityTap(int jewId) {
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == jewId) {
        return e.copyWith(quantity: e.quantity + 1);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void onDecreaseQuantityTap(int jewId) {
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == jewId) {
        return e.quantity == 1 ? e : e.copyWith(quantity: e.quantity - 1);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void onAddToCartTap(int jewId){
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == jewId) {
        return e.copyWith(cart: true);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void onRemoveFromCartTap(int jewId){
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == jewId) {
        return e.copyWith(cart: false, quantity: 1);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void onCheckOutTap(){
    List<Jew> jews = <Jew>[];
    Set<int> cartIds = <int>{};
    for (var item in cart) {
      cartIds.add(item.id);
    }
    jews = state.jews.map((e) {
      if (cartIds.contains(e.id)) {
        return e.copyWith(cart: false, quantity: 1);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void onAddRemoveFavoriteTap(int jewId){
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == jewId) {
        return e.copyWith(isFavorite: !e.isFavorite);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void onToggleThemeTab(){
    emit(state.copyWith(isLight: !state.isLight));
  }

  List<Jew> get cart => state.jews.where((e) => e.cart).toList();
  List<Jew> get favorite => state.jews.where((e) => e.isFavorite).toList();
  int getIndex(int jewId) {
    int index = state.jews.indexWhere((e) => e.id == jewId);
    return index;
  }
  Jew getJewById(int jewId) {
    return state.jews[getIndex(jewId)];
  }
  String jewPrice(Jew jew) {
    return (jew.quantity * jew.price).toString();
  }

  double get subtotal {
    double amount = 0.0;
    for (var e in cart) {
      amount = amount + e.price * e.quantity;
    }
    return amount;
  }
}