import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stateless/stateless.dart';
import 'package:webview_ads/controller/hi.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class MyCounterState {
  late int counter;
}

class Second extends Stateless implements MyCounterState {
  Second({
    super.key,
  });

  var one = Get.arguments;

  HiController con = Get.put(HiController());

  

  late WebViewController controller;

  late String? videoId;
  
  @override
  void initState() {
    videoId = YoutubePlayer.convertUrlToId(
        "$one");
    print(videoId);
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId!,
    );
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
            height: size.height,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * 0.05,
                  width: size.width,
                  color: Colors.green,
                  child: con.isLoad
                      ? Container(
                          height: con.bannerAd.size.height.toDouble(),
                          width: con.bannerAd.size.width.toDouble(),
                          child: AdWidget(ad: con.bannerAd),
                        )
                      : SizedBox(
                          child: Center(child: Text("No ads available")),
                        ),
                ),
                SizedBox(height: size.height*0.25,),
                YoutubePlayer(
                  showVideoProgressIndicator: true,
                  controller:
                      YoutubePlayerController(initialVideoId: videoId!),
                ),
                Spacer(),
                Container(
                  height: size.height * 0.05,
                  width: size.width,
                  color: Colors.green,
                  child: con.isLoad
                      ? Container(
                          height: con.bannerAd.size.height.toDouble(),
                          width: con.bannerAd.size.width.toDouble(),
                          child: AdWidget(ad: con.bannerAd),
                        )
                      : SizedBox(
                          child: Center(child: Text("No ads available")),
                        ),
                ),
              ],
            )
            ),
      ),
    );
  }
}
