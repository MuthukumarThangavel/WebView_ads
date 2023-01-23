import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_ads/controller/hi.dart';
import 'package:webview_ads/second.dart';
import 'package:webview_ads/widget/card.dart';

class Home extends StatelessWidget {
  Home({super.key});

  HiController controller = Get.put(HiController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 221, 230),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.01),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CardC(),
                  Divider(),
                  CardC(),
                  Divider(),
                  CardC(),
                  Divider(),
                  CardC(),
                  Divider(),
                  CardC(),
                  Divider(),
                  ],
              ),
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
