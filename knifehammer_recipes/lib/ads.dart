import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyBannerAd extends StatefulWidget {
  const MyBannerAd({Key? key}) : super(key: key);

  @override
  State<MyBannerAd> createState() => _MyBannerAdState();
}

class _MyBannerAdState extends State<MyBannerAd> {
  late BannerAd _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: ZzaUtil.getBannerAdUnitId(),
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
