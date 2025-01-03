import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<dynamic> conversation = [
    {
      "userId": {
        "profilePic":
            "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
        "_id": "1234"
      },
      "message": "Hello",
      "type": "MESSAGE"
    },
  ];

  Map<String, Object> newMessage = {
    "userId": {
      "profilePic":
          "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
      "_id": "1232"
    },
    "message": "Hello21",
    "type": "MESSAGE"
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ChatView(
              messages: conversation,
              conversationId: "123",
              profilePic:
                  "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
              userName: "yoyo",
              clientId: "1234",
              onMessageSend: (message) {
                debugPrint(message);
                setState(() {
                  conversation.add(newMessage);
                });
              },
              onAssetSend: (assets) {},
              onVMSend: (audio) {})),
    );
  }
}
