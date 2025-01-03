import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter/material.dart';

class MessageSent extends StatelessWidget {
  final String message;
  final String profilePic;
  const MessageSent(
      {super.key, required this.message, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatBubble(
          clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
          alignment: Alignment.topRight,
          margin: const EdgeInsets.only(top: 20),
          backGroundColor: Colors.blue,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.network(
                profilePic,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            )),
      ],
    );
  }
}

class MessageReceived extends StatelessWidget {
  final String message;
  final String profilePic;
  const MessageReceived(
      {super.key, required this.message, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.network(
                profilePic,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            )),
        ChatBubble(
          clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
          backGroundColor: const Color(0xffE7E7ED),
          margin: const EdgeInsets.only(top: 20),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
