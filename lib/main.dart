import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jewellry_shop/ui/screens/home_screen.dart';
import 'ui/_ui.dart';
import 'ui_kit/_ui_kit.dart';


void main() {
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jewellery Shop',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
