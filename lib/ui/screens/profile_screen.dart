import 'package:flutter/material.dart';
import 'package:jewellry_shop/ui_kit/_ui_kit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(AppAsset.profileImage, width: 300),
          ),
          Text(
            "Hello Mavi!",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Profile screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}


