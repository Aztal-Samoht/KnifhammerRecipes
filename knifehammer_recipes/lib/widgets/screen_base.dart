///This Widget serves as a starting point for all screens in the app.
///It handles adding a banner ad to the bottom of each screen and otherwise acts
///as a scaffold, taking an Appbar and Body and a bool to deactivate the ad if
///desired.

import 'package:flutter/material.dart';
import 'package:knifehammer_recipes/ads.dart';

class ScreenBase extends StatelessWidget {
  const ScreenBase(
      {Key? key, this.body, this.appbar, this.floatingActionButton, this.noAd})
      : super(key: key);
  final bool? noAd;
  final Widget? body;
  final AppBar? appbar;
  final FloatingActionButton? floatingActionButton;

  _body() => noAd ?? false
      ? body ?? const Placeholder()
      : Stack(
          children: [
            body ?? const Placeholder(),
            const MyBannerAd(),
          ],
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        appBar: appbar ?? AppBar(title: Text(runtimeType.toString())),
        body: _body(),
      ),
    );
  }
}
