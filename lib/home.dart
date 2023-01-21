import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_ads/controller/hi.dart';
import 'package:webview_ads/second.dart';

class Home extends StatelessWidget {
  Home({super.key});

  HiController controller = Get.put(HiController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 151, 159, 173),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width,
                    decoration: BoxDecoration(
                      // color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  "Elon Musk",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.19,
                          width: size.width,
                          // color: Colors.amberAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectableLinkify(
                                  text:
                                      "Video 1 : https://www.youtube.com/watch?v=lrf-GAYUOkQ\n\nVideo 2 : https://www.youtube.com/watch?v=UKRYHQALlAI",
                                  style: TextStyle(fontSize: 20),
                                  // onOpen: _onOpen,
                                  onOpen: (link) async {
                                    Get.to(() => Second(),arguments: link.url);
                                  //   final Uri url = Uri.parse(link.url);
                                  //   if (!await launchUrl(url)) {
                                  //     throw 'Could not launch $url';
                                  // }
                                  },
                                  onTap: () {
                                    print("hi");
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.favorite_border_outlined),
                                Icon(Icons.message_outlined),
                                Icon(Icons.share_outlined),
                                Icon(Icons.replay),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Padding(
                    //     padding: EdgeInsets.all(8.0),
                    //     child: SelectableLinkify(
                    //       text:
                    //           "Made by https://cretezy.com\n\nMail: example@gmail.com",
                    //           style: TextStyle(fontSize: 20),
                    //           onTap: () {
                    //             print("hi");
                    //           },
                    //     ),
                    //   ),
                  ),
                ),
                // Container(
                //   height: size.height*0.05,
                //   width: size.width,
                //   color: Colors.green,
                //   child: )
                // Container(
                //   height: size.height * 0.05,
                //   width: size.width,
                //   color: Colors.green,
                //   child: controller.isLoad
                //       ? Container(
                //           height: controller.bannerAd.size.height.toDouble(),
                //           width: controller.bannerAd.size.width.toDouble(),
                //           child: AdWidget(ad: controller.bannerAd),
                //         )
                //       : SizedBox(
                //           child: Center(child: Text("No ads available")),
                //         ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    final Uri url = Uri.parse(link.url);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
