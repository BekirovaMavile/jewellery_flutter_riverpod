import 'package:flutter/cupertino.dart';
import 'package:jewellry_shop/data/_data.dart';
import 'package:jewellry_shop/states/jew/jew_state.dart';

class JewProvider extends ChangeNotifier{
  JewState _state;

  JewProvider() : _state = JewState.initial(AppData.jewItems);

  JewState get state => _state;

  get getCartList => _state.jewList.where((element) => element.cart).toList();
  get isFavorite => _state.jewList.where((element) => element.isFavorite).toList();


  increaseQuantity(Jew jew) {
    int index = _state.jewList.indexWhere((element) => element.id == jew.id);
    final List<Jew> jewList = _state.jewList.map((element) {
      if (element.id == jew.id) {
        return _state.jewList[index]
            .copyWith(quantity: _state.jewList[index].quantity + 1);
      }
      return element;
    }).toList();
    _state = _state.copyWith(jewList: jewList);
    notifyListeners();
  }

  decreaseQuantity(Jew jew) {
    int index = _state.jewList.indexWhere((element) => element.id == jew.id);
    final List<Jew> jewList = _state.jewList.map((element) {
      if (element.id == jew.id && element.quantity > 1) {
        return _state.jewList[index].copyWith(
          quantity: _state.jewList[index].quantity - 1,
        );
      }
      return element;
    }).toList();
    _state = _state.copyWith(jewList: jewList);
    notifyListeners();
  }

  addToCart (Jew jew){
    final List<Jew> cartList = _state.jewList.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(cart:true);
      }
      return element;
    }).toList();
    _state = _state.copyWith(jewList: cartList);
    notifyListeners();
  }

  deleteFromCart(Jew jew){
    final List<Jew> cartList = _state.jewList.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(cart:false);
      }
      return element;
    }).toList();
    _state = _state.copyWith(jewList: cartList);
    notifyListeners();
  }

  isFavoriteTab(Jew jew){
    int index = _state.jewList.indexWhere((element) => element.id == jew.id);
    final List<Jew> jewList = _state.jewList.map((element) {
      if (element.id == jew.id) {
        return jew.copyWith(isFavorite: !_state.jewList[index].isFavorite);
      }
      return element;
    }).toList();
    _state = _state.copyWith(jewList: jewList);
    notifyListeners();
  }

  void cleanCart(){
    final List<Jew> cartList = _state.jewList.map((element) {
      return element.copyWith(cart:false);
    }).toList();
    _state = _state.copyWith(jewList: cartList);
    notifyListeners();
  }

  String priceJew(Jew jew){
    double price = 0;
    price = jew.quantity * jew.price;
    return price.toString();
  }

  double get subtotalPrice{
    double subtotal = 0;
    for (var element in _state.jewList){
      if (element.cart){
        subtotal += element.quantity * element.price;
      }
    }
    return subtotal;
  }
}