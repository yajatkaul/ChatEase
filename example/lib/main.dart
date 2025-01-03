import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ChatView(
              conversationId: "123",
              profilePic:
                  "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
              userName: "yoyo",
              defaultImage:
                  "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
              clientId: "1",
              onMessageSend: () {},
              onAssetSend: () {},
              onVMSend: () {})),
    );
  }
}
