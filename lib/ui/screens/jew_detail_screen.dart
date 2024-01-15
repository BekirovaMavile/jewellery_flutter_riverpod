import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jewellry_shop/data/_data.dart';
import 'package:jewellry_shop/states/jew_state.dart';
import 'package:jewellry_shop/ui/widgets/counter_button.dart';
import 'package:jewellry_shop/ui_kit/_ui_kit.dart';

class JewDetail extends StatelessWidget {
  const JewDetail({super.key, required this.jew});
  final Jew jew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(child: Image.asset(jew.image, scale: 2)),
      floatingActionButton: _floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: _bottomAppBar(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(
        'Jewellery Detail Screen',
        style: TextStyle(color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    // final List<Jew> jewList = context.watch<JewProvider>().state.jewList;
    // final jewIndex = jewList.indexWhere((element) => element.id == jew.id);
    return Builder(
        builder: (context) {
          return FloatingActionButton(
            elevation: 0.0,
            backgroundColor: LightThemeColor.purple,
            onPressed: () {
            },
            child: jew.isFavorite ? const Icon(AppIcon.heart) : const Icon(AppIcon.outlinedHeart),
          );
        }
    );
  }

  Widget _bottomAppBar(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
            child: Container(
              color: Theme.of(context).brightness == Brightness.dark ? DarkThemeColor.primaryLight : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RatingBar.builder(
                            itemPadding: EdgeInsets.zero,
                            itemSize: 20,
                            initialRating: jew.score,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            glow: false,
                            ignoreGestures: true,
                            itemBuilder: (_, __) => const FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: LightThemeColor.yellow,
                            ),
                            onRatingUpdate: (rating) {
                              print('$rating');
                            },
                          ),
                          const SizedBox(width: 15),
                          Text(
                            jew.score.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "(${jew.voter})",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${jew.price}",
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(color: LightThemeColor.purple),
                          ),
                           CounterButton(
                                  onIncrementTap: () {
                                  },
                                  onDecrementTap: () {
                                  },
                                  label: Text(
                                    '${jew.quantity}',
                                    style: Theme.of(context).textTheme.displayLarge,
                                  ),
                                ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        jew.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            child: const Text("Add to cart"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ),
    );
  }
}