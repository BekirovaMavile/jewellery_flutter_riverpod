import 'package:flutter/foundation.dart';
import '../../data/_data.dart';

@immutable
class CategoryState {
  final List<JewCategory> jewCategories;
  final List<Jew> jews;

  const CategoryState.initial(
      List<Jew> jews,
      List<JewCategory> jewCategories,
      ) : this(jews: jews, jewCategories: jewCategories);

  const CategoryState({required this.jewCategories, required this.jews});

  @override
  List<Object?> get props => [jewCategories, jews];

  CategoryState copyWith({
    List<JewCategory>? jewCategories,
    List<Jew>? jews,
  }) {
    return CategoryState(
      jewCategories: jewCategories ?? this.jewCategories,
      jews: jews ?? this.jews,
    );
  }
}