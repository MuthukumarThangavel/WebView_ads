import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                          child: Center(
                            child: SelectableLinkify(
                              text:
                                  "Wellcome to GoApp https://goappinfo.tech/\n\nMail: goappinfotech@gmail.com",
                              style: TextStyle(fontSize: 20),
                              onOpen: _onOpen,
                              // onOpen: (link) async {
                              //   final Uri url = Uri.parse(link.url);
                              //   if (!await launchUrl(url)) {
                              //     throw 'Could not launch $url';
                              //   }
                              // },
                              onTap: () {
                                print("hi");
                              },
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
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                //   height: size.height/2,
                //   width: size.width,
                //   child: 
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
