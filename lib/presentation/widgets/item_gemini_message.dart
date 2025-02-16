
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../data/models/message_model.dart';
import '../controllers/home_controller.dart';
import '../pages/webview_page.dart';

Widget itemOfGeminiMessage(
    MessageModel message, HomeController homeController) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(top: 15, bottom: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 24,
              child: Image.asset('assets/images/gemini_icon.png'),
            ),
            GestureDetector(
              onTap: () {
                homeController.speakTTS(message.message!);
              },
              child: Icon(
                Icons.volume_up,
                color: Colors.white70,
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Linkify(
            onOpen: (link) async {
              // Open the link in a webview
              Get.to(WebViewPage(url: link.url));
            },
            text: message.message!,
            style: TextStyle(
                color: Color.fromRGBO(173, 173, 176, 1), fontSize: 16),
            linkStyle: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    ),
  );
}