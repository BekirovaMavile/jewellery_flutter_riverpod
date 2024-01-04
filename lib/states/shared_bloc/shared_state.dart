part of 'shared_bloc.dart';

class SharedState extends Equatable {
  SharedState({
    required this.categories,
    required this.jews,
    required this.isLight,
    required this.jewsByCategory,
  });
  List<JewCategory> categories;
  List<Jew> jews;
  List<Jew> jewsByCategory;
  bool isLight;

  SharedState.initial() : this(
    categories: AppData.categories,
    jews: AppData.jewItems,
    jewsByCategory: AppData.jewItems,
    isLight: true,
  );

  @override
  List<Object?> get props => [categories,jews,jewsByCategory,isLight];

  SharedState copyWith({
    List<JewCategory>? categories,
    List<Jew>? jews,
    List<Jew>? jewsByCategory,
    bool? isLight,
  }) {
    return SharedState(
      categories: categories ?? this.categories,
      jews: jews ?? this.jews,
      jewsByCategory: jewsByCategory ?? this.jewsByCategory,
      isLight: isLight ?? this.isLight,
    );
  }
}