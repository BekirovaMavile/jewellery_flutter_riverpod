import 'package:flutter/material.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/states/shared_bloc/shared_bloc.dart';
import 'package:jewellry_shop/ui/_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellry_shop/ui/screens/home_screen.dart';
import 'package:jewellry_shop/ui_kit/app_theme.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SharedBloc>(
      create: (context) => SharedBloc(),
      child: Builder(
          builder: (context) {
            final isLight = context.select((SharedBloc b) => b.state.isLight);
            return MaterialApp(
              title: 'Jewellery Shop',
              theme: isLight ? AppTheme.lightTheme: AppTheme.darkTheme,
              home: const HomeScreen(),
            );
          }
      ),
    );
  }
}


class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  ///We can run something, when we create our Bloc
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    ///We can check, if the BlocBase is a Bloc or a Cubit
    if (bloc is Cubit) {
      debugPrint("BlocObserver >> Создан Cubit");
    } else {
      debugPrint("BlocObserver >> Создан Bloc");
    }
  }

  ///We can react to events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint("BlocObserver >> Улетело событие $event");
  }

  ///We can even react to transitions
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    /// With this we can specifically know, when and what changed in our Bloc
    debugPrint("BlocObserver >> Запускаем перерисовку экранов");
  }

  ///We can react to errors, and we will know the error and the StackTrace
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint("BlocObserver >> Произошла ошибка в блоке $bloc >> $error >> $stackTrace");
  }

  ///We can even run something, when we close our Bloc
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint("BLoC is closed");
  }
}
