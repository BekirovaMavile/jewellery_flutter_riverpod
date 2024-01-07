import 'package:flutter/material.dart';
import 'package:jewellry_shop/states/category/category_provider.dart';
import 'package:jewellry_shop/states/jew/jew_provider.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/states/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:jewellry_shop/ui/_ui.dart';
import 'package:jewellry_shop/ui/screens/home_screen.dart';
import 'package:jewellry_shop/ui_kit/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<JewProvider>(
          create: (context) => JewProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (_, themeProvider, __) => MaterialApp(
          title: 'Jewellery Shop',
          home: const HomeScreen(),
          theme: themeProvider.state.theme,
        ),
      ),
    );
  }
}