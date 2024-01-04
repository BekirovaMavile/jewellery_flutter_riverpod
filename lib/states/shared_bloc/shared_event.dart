part of 'shared_bloc.dart';

abstract class SharedEvent{}

class  CategoryTapEvent extends SharedEvent{
  CategoryTapEvent(this.category);
  final JewCategory category;
}

// class  SetSelectedStickerEvent extends SharedEvent{
//   SetSelectedStickerEvent(this.stickerId);
//   final int stickerId;
// }

class  IncreaseQuantityTapEvent extends SharedEvent{
  IncreaseQuantityTapEvent(this.jewId);
  final int jewId;
}

class  DecreaseQuantityTapEvent extends SharedEvent{
  DecreaseQuantityTapEvent(this.jewId);
  final int jewId;
}

class  AddToCartTapEvent extends SharedEvent{
  AddToCartTapEvent(this.jewId);
  final int jewId;
}

class  RemoveFromCartTapEvent extends SharedEvent{
  RemoveFromCartTapEvent(this.jewId);
  final int jewId;
}

class CheckOutTapEvent extends SharedEvent {}


class  AddRemoveFavoriteTapEvent extends SharedEvent{
  AddRemoveFavoriteTapEvent(this.jewId);
  final int jewId;
}

class ToggleThemeTabEvent extends SharedEvent {}

