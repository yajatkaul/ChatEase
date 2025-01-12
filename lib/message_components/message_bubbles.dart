import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// Component for messages sent in chat
class MessageSent extends StatelessWidget {
  /// message sent
  final String message;

  /// url of profile picture of user
  final String profilePic;

  /// required for component
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: MarkdownBody(
                data: message,
                styleSheet: MarkdownStyleSheet(
                  p: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              width: 40,
              height: 40,
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

/// Component for messages received in chat
class MessageReceived extends StatelessWidget {
  /// message received
  final String message;

  /// url of profile picture of user
  final String profilePic;

  /// required for component
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
              width: 40,
              height: 40,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: MarkdownBody(
                data: message,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
