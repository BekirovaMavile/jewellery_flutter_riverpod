import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewellry_shop/states/shared/shared_state.dart';
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
    final jews = state.jews.map((e) {
      if (e.id == jewId) {
        return e.copyWith(quantity: e.quantity + 1);
      } else {
        return e;
      }
    }).toList();
  }

  Future<void> onDecreaseQuantityTap(int jewId) async {
    final jews = state.jews.map((e) {
      if (e.id == jewId) {
        return e.quantity == 1 ? e : e.copyWith(quantity: e.quantity - 1);
      } else {
        return e;
      }
    }).toList();
  }

}