import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyBannerAd extends StatefulWidget {
  const MyBannerAd({Key? key}) : super(key: key);

  @override
  State<MyBannerAd> createState() => _MyBannerAdState();
}

class _MyBannerAdState extends State<MyBannerAd> {
  late BannerAd _bannerAd;
  bool _isLoaded = false;
  String _getBannerAdUnitId() {
    return kDebugMode
        ? Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/6300978111' //sample Andrid
            : 'ca-app-pub-3940256099942544/2934735716' //sample iOS
        : Platform.isAndroid
            ? 'ca-app-pub-5934630788997149/2851440060' //Android banner ID
            : 'ca-app-pub-5934630788997149/3465471552`'; //iOS banner ID
  }

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: _getBannerAdUnitId(),
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(
            () {
              _isLoaded = true;
            },
          );
        },
        onAdFailedToLoad: (ad, err) {
          if (kDebugMode) {
            print('Failed to load banner ad: ${err.message}');
          }
          _isLoaded = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
        child: _isLoaded ? AdWidget(ad: _bannerAd) : const Placeholder(),
      ),
    );
  }
}
