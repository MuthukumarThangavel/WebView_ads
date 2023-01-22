import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_ads/controller/hi.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Second extends StatelessWidget {
 Second({super.key,});

  var one = Get.arguments;

  HiController con = Get.put(HiController());

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
           height: size.height,
          child: Column(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: size.height,
                        child: WebView(
                          initialUrl: "$one",
                          javascriptMode: JavascriptMode.unrestricted,
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
          // Center(child: Text("${one[0]}")),
        ),
      ),
    );
  }
}