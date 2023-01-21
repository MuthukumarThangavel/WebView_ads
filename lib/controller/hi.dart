import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HiController extends GetxController {
  late BannerAd bannerAd;
  AppOpenAd? appOpenAd;
  RewardedAd? _rewardedAd;
  bool isLoad = false;

  add() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isLoad = true;
        },
        onAdFailedToLoad: (ad, error) {},
      ),
      request: AdRequest(),
    );
    bannerAd.load();
    print('So$bannerAd');
    update();

    @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
      add();
      print('Hi');

      update();
    }
  }
}
