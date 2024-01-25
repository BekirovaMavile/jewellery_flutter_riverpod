import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../data/_data.dart';

class SharedState extends Equatable {
  final List<JewCategory> categories;
  get getCartList => jews.where((element) => element.cart).toList();
  get isFavorite => jews.where((element) => element.isFavorite).toList();
  final List<Jew> jews;
  final List<Jew> jewsByCategory;
  final bool light;
  ValueNotifier<bool> isLight = ValueNotifier(true);
  SharedState({
    required this.categories,
    required this.jews,
    required this.jewsByCategory,
    required this.light
  });

  SharedState.initial(): this(
    categories: AppData.categories,
    jews: AppData.jewItems,
    jewsByCategory: AppData.jewItems,
    light: true,
  );

  @override
  List<Object?> get props => [categories, jews, jewsByCategory, light];

  SharedState copyWith({
    List<JewCategory>? categories,
    List<Jew>? jews,
    List<Jew>? jewsByCategory,
    bool? light
  }) {
    return SharedState(
        categories: categories ?? this.categories,
        jews: jews ?? this.jews,
        jewsByCategory: jewsByCategory ?? this.jewsByCategory,
        light: light ?? this.light
    );
  }

}
