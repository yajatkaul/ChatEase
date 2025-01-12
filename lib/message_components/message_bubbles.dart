import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:any_link_preview/any_link_preview.dart';

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
    // Regular expression to find links in the message
    final RegExp linkRegExp = RegExp(
      r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+',
    );
    final String? link = linkRegExp.firstMatch(message)?.group(0);

    if (link != null) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (AnyLinkPreview.isValidLink(link))
                      AnyLinkPreview(
                        link: link,
                        displayDirection: UIDirection.uiDirectionVertical,
                        showMultimedia: true,
                        bodyMaxLines: 5,
                        bodyTextOverflow: TextOverflow.ellipsis,
                        titleStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        bodyStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        errorBody: 'Could not load preview',
                        errorTitle: 'Error',
                        errorWidget: Container(
                          color: Colors.grey[300],
                          child: const Text('Oops!'),
                        ),
                        cache: const Duration(days: 7),
                        backgroundColor: Colors.grey[300],
                        borderRadius: 12,
                        removeElevation: false,
                        onTap: () => launchUrl(Uri.parse(link)),
                      ),
                    MarkdownBody(
                      data: message,
                      onTapLink: (text, href, title) =>
                          launchUrl(Uri.parse(href!)),
                      styleSheet: MarkdownStyleSheet(
                          p: const TextStyle(color: Colors.white),
                          a: const TextStyle(
                              color: Color.fromARGB(255, 179, 202, 243))),
                    ),
                  ],
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
    } else {
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
    // Regular expression to find links in the message
    final RegExp linkRegExp = RegExp(
      r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+',
    );
    final String? link = linkRegExp.firstMatch(message)?.group(0);

    if (link != null) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (AnyLinkPreview.isValidLink(link))
                      AnyLinkPreview(
                        link: link,
                        displayDirection: UIDirection.uiDirectionVertical,
                        showMultimedia: true,
                        bodyMaxLines: 5,
                        bodyTextOverflow: TextOverflow.ellipsis,
                        titleStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        bodyStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        errorBody: 'Could not load preview',
                        errorTitle: 'Error',
                        errorWidget: Container(
                          color: Colors.grey[300],
                          child: const Text('Oops!'),
                        ),
                        cache: const Duration(days: 7),
                        backgroundColor: Colors.grey[300],
                        borderRadius: 12,
                        removeElevation: false,
                        onTap: () => launchUrl(Uri.parse(link)),
                      ),
                    MarkdownBody(
                      data: message,
                      onTapLink: (text, href, title) =>
                          launchUrl(Uri.parse(href!)),
                      styleSheet: MarkdownStyleSheet(
                          a: const TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
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
}
