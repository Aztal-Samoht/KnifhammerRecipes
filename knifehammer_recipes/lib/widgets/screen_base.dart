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

  @override
  Widget build(BuildContext context) {
    return floatingActionButton == null
        ? SafeArea(
            child: Scaffold(
              appBar: appbar ?? AppBar(title: Text(runtimeType.toString())),
              body: Stack(
                children: [
                  body ?? const Placeholder(),
                  const MyBannerAd(),
                ],
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              appBar: appbar ?? AppBar(),
              floatingActionButton: floatingActionButton,
              body: Stack(
                children: [
                  body ?? const Placeholder(),
                  const MyBannerAd(),
                ],
              ),
            ),
          );
  }
}
