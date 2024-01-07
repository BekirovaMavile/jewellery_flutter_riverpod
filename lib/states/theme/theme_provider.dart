import 'package:flutter/material.dart';
import 'package:jewellry_shop/states/theme/theme_state.dart';

import '../../ui_kit/_ui_kit.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeState _state;

  ThemeState get state => _state;

  ThemeProvider() : _state = ThemeState.initial();

  switchTheme() {
    if (_state.theme == AppTheme.lightTheme) {
      _state = _state.copyWith(theme: AppTheme.darkTheme!);
    } else {
      _state = _state.copyWith(theme: AppTheme.lightTheme!);
    }
    notifyListeners();
  }
}