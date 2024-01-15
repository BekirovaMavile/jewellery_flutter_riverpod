import 'package:flutter/material.dart';
import 'package:jewellry_shop/data/_data.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/ui/widgets/empty_wrapper.dart';
import 'package:jewellry_shop/ui_kit/_ui_kit.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteJew = AppData.favoriteItems;
    debugPrint('FavoriteScreen >> Перерисовка любимых');
    return Scaffold(
      appBar: _appBar(context),
      body: EmptyWrapper(
        type: EmptyWrapperType.favorite,
        title: "Empty favorite",
        isEmpty: favoriteJew.isEmpty,
        child: _favoriteListView(context),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Favorite screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _favoriteListView(BuildContext context) {
    final favoriteJew = AppData.favoriteItems;
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: favoriteJew.length,
      itemBuilder: (_, index) {
        Jew jew = favoriteJew[index];
        return Card(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : DarkThemeColor.primaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            title: Text(
              jew.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            leading: Image.asset(jew.image),
            subtitle: Text(
              jew.description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: const Icon(AppIcon.heart, color: Colors.redAccent),
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        height: 20,
      ),
    );
  }
}