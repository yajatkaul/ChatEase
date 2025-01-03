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
    {
      "userId": {
        "profilePic":
            "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
        "_id": "1234"
      },
      "message": "Free today?",
      "type": "MESSAGE"
    },
    {
      "userId": {
        "profilePic":
            "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
        "_id": "1234"
      },
      "message": "Let's hang out",
      "type": "MESSAGE"
    },
  ];

  Map<String, Object> newMessage = {
    "userId": {
      "profilePic":
          "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
      "_id": "1235"
    },
    "message": "Sure",
    "type": "MESSAGE"
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ChatView(
              messages: conversation,
              conversationId: "1",
              profilePic:
                  "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
              userName: "Adam",
              clientId: "1235",
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
