
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/_data.dart';
part 'shared_event.dart';
part 'shared_state.dart';

class SharedBloc extends Bloc<SharedEvent, SharedState> {
  SharedBloc() : super(SharedState.initial()) {
    on<CategoryTapEvent>(_onCategoryTap);
    on<IncreaseQuantityTapEvent>(_onIncreaseQuantityTap);
    on<DecreaseQuantityTapEvent>(_onDecreaseQuantityTap);
    on<AddToCartTapEvent>(_onAddToCartTap);
    on<RemoveFromCartTapEvent>(_onRemoveFromCartTap);
    on<CheckOutTapEvent>(_onCheckOutTap);
    on<AddRemoveFavoriteTapEvent>(_onAddRemoveFavoriteTap);
    on<ToggleThemeTabEvent>(_onToggleThemeTab);
  }

  void _onCategoryTap(CategoryTapEvent event, Emitter<SharedState>  emit){
    final List<JewCategory> categories = state.categories.map((e) {
      if (e.type == event.category.type) {
        return e.copyWith(isSelected: true);
      } else {
        return e.copyWith(isSelected: false);
      }
    }).toList();
    if (event.category.type == JewType.all) {
      emit(state.copyWith(categories: categories, jewsByCategory: state.jews));
    } else {
      final List<Jew> jewsByCategory = state.jews
          .where((e) => e.type == event.category.type)
          .toList();
      emit(state.copyWith(categories: categories, jewsByCategory: jewsByCategory));
    }
  }


  void _onIncreaseQuantityTap(IncreaseQuantityTapEvent event, Emitter<SharedState> emit) {
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == event.jewId) {
        return e.copyWith(quantity: e.quantity + 1);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void _onDecreaseQuantityTap(DecreaseQuantityTapEvent event, Emitter<SharedState> emit) {
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == event.jewId) {
        return e.quantity == 1 ? e : e.copyWith(quantity: e.quantity - 1);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void _onAddToCartTap(AddToCartTapEvent event, Emitter<SharedState> emit){
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == event.jewId) {
        return e.copyWith(cart: true);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void _onRemoveFromCartTap(RemoveFromCartTapEvent event, Emitter<SharedState> emit){
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == event.jewId) {
        return e.copyWith(cart: false, quantity: 1);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void _onCheckOutTap(CheckOutTapEvent event, Emitter<SharedState> emit){
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

  void _onAddRemoveFavoriteTap(AddRemoveFavoriteTapEvent event, Emitter<SharedState> emit){
    final List<Jew> jews = state.jews.map((e) {
      if (e.id == event.jewId) {
        return e.copyWith(isFavorite: !e.isFavorite);
      } else {
        return e;
      }
    }).toList();
    emit(state.copyWith(jews: jews));
  }

  void _onToggleThemeTab(ToggleThemeTabEvent event, Emitter<SharedState> emit){
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