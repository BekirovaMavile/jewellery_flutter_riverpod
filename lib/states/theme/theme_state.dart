import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../ui_kit/_ui_kit.dart';

@immutable
class ThemeState {
  final ThemeData theme;

  const ThemeState({required this.theme});

  ThemeState copyWith({ThemeData? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }

  factory ThemeState.initial() {
    return ThemeState(theme: AppTheme.lightTheme!);
  }
}