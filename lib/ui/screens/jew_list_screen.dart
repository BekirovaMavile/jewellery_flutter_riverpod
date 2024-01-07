import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewellry_shop/data/models/jew.dart';
import 'package:jewellry_shop/states/category/category_provider.dart';
import 'package:jewellry_shop/states/jew/jew_provider.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/states/theme/theme_provider.dart';
import 'package:jewellry_shop/ui/extensions/app_extension.dart';
import 'package:jewellry_shop/ui/widgets/jew_list_view.dart';
import '../../data/_data.dart';
import '../../ui_kit/_ui_kit.dart';
import 'package:provider/provider.dart';

class JewList extends StatelessWidget {
  const JewList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Jew> jewList = context.watch<JewProvider>().state.jewList;
    final List<Jew> filteredJew = context.watch<CategoryProvider>().state.jews;
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Morning, Mavi",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "What jewellery do you want\nto buy today",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              _searchBar(),
              Text(
                "Available for you",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              _categories(context),
              JewListView(jews: filteredJew),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best jewellery of the week",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "See all",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: LightThemeColor.purple),
                      ),
                    ),
                  ],
                ),
              ),
              JewListView(jews: jewList, isReversed: true),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.dice),
        onPressed: () => context.read<ThemeProvider>().switchTheme(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on_outlined, color: LightThemeColor.purple),
          Text(
            "Location",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge(
            badgeStyle: const BadgeStyle(badgeColor: LightThemeColor.purple),
            badgeContent: const Text(
              "2",
              style: TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topStart(start: -3),
            child: const Icon(Icons.notifications_none, size: 30),
          ),
        )
      ],
    );
  }

  Widget _searchBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search jewellery',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _categories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 40,
        child: Builder(
            builder: (context) {
              final List<JewCategory> categories = context.watch<CategoryProvider>().state.jewCategories;
              debugPrint('JewList >> Изменение длины списка категории');
              return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Builder(
                        builder: (context) {
                          final category = categories[index];
                          debugPrint('JewList >> Перерисовка категории ${category.type}');
                          return GestureDetector(
                            onTap: () =>
                              context
                                  .read<CategoryProvider>().onCategoryTab(category),
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: category.isSelected ? LightThemeColor.purple : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                category.type.name.toCapital,
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                          );
                        }
                    );
                  },
                  separatorBuilder: (_, __) => Container(
                    width: 15,
                  ),
                  itemCount: categories.length);
            }
        ),
      ),
    );
  }
}