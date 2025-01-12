import 'package:chatease/chatview.dart';
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
      "message":
          "https://i.pinimg.com/originals/a8/2c/4b/a82c4b062593c35f4ebcf1617e83cacd.png",
      "type": "IMAGE"
    },
    // {
    //   "userId": {
    //     "profilePic":
    //         "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
    //     "_id": "1234"
    //   },
    //   "message":
    //       "https://videos.pexels.com/video-files/4830364/4830364-uhd_1440_2732_25fps.mp4",
    //   "type": "VIDEO"
    // },
    {
      "userId": {
        "profilePic":
            "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
        "_id": "1234"
      },
      "message": "https://download.samplelib.com/mp3/sample-3s.mp3",
      "type": "VOICE"
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

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ChatView(
              scrollController: _scrollController,
              messages: conversation,
              conversationId: "1",
              image:
                  "https://www.shutterstock.com/image-vector/anime-boy-black-hair-hoodie-600nw-2078861473.jpg",
              name: "Adam",
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
