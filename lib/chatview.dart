import 'dart:async';

import 'package:chatview/message_components/image_message_bubble.dart';
import 'package:chatview/message_components/message_bubbles.dart';
import 'package:chatview/message_components/video_message_bubble.dart';
import 'package:chatview/message_components/vm_message_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:waveform_recorder/waveform_recorder.dart';

class ChatView extends StatefulWidget {
  final String conversationId;
  final String userName;
  final String? profilePic;
  final String clientId;
  final VoidCallback? onMessageSend;
  final VoidCallback? onAssetSend;
  final VoidCallback? onVMSend;
  final String defaultImage;
  const ChatView({
    super.key,
    required this.conversationId,
    required this.profilePic,
    required this.userName,
    required this.defaultImage,
    required this.clientId,
    required this.onMessageSend,
    required this.onAssetSend,
    required this.onVMSend,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<dynamic> messages = [
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
        "_id": "1232"
      },
      "message": "Hello21",
      "type": "MESSAGE"
    }
  ];
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    //messages = await ChatHooks().getMessages(context, widget.conversationId);
    setState(() {});
    _scrollToBottom();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _waveController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendAsset() async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(context);

    if (result != null) {
      try {
        widget.onAssetSend!();
      } catch (e) {
        debugPrint('Error occurred while uploading assets: $e');
      }
    }
  }

  final _waveController = WaveformRecorderController();
  bool _isCanceled = false;

  _toggleRecording() async {
    if (_waveController.isRecording) {
      await _waveController.stopRecording();
    } else {
      await _waveController.startRecording();
    }
    setState(() {
      _isCanceled = false;
    });
  }

  _onRecordingStopped() async {
    if (_isCanceled) {
      debugPrint("Recording canceled");
    } else {
      final file = _waveController.file;
      if (file == null) return;
      widget.onVMSend!();
    }
  }

  _onRecodingCanceled() async {
    setState(() {
      _isCanceled = true;
    });
    await _waveController.stopRecording();
    setState(() {});
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                widget.profilePic ?? widget.defaultImage,
              ),
              radius: 16,
            ),
            const SizedBox(width: 8),
            Text(widget.userName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(
              controller: _scrollController,
              children: messages.map((message) {
                if (message['type'] == "MESSAGE") {
                  if (message['userId']['_id'] == widget.clientId) {
                    return MessageSent(
                      profilePic: message['message']['profilePic'],
                      message: message['message'],
                    );
                  } else {
                    return MessageReceived(
                      profilePic: message['userId']['profilePic'],
                      message: message['message'],
                    );
                  }
                } else if (message['type'] == "IMAGE") {
                  if (message['userId']['_id'] == widget.clientId) {
                    return ImageSent(
                      profilePic: message['message']['profilePic'],
                      image: message['message'],
                    );
                  } else {
                    return ImageReceived(
                      profilePic: message['userId']['profilePic'],
                      image: message['message'],
                    );
                  }
                } else if (message['type'] == "VIDEO") {
                  if (message['userId']['_id'] == widget.clientId) {
                    return VideoSent(
                      profilePic: message['message']['profilePic'],
                      video: message['message'],
                    );
                  } else {
                    return VideoRecieved(
                      profilePic: message['userId']['profilePic'],
                      video: message['message'],
                    );
                  }
                } else if (message['type'] == "VOICE") {
                  if (message['userId']['_id'] == widget.clientId) {
                    return VMSent(
                        profilePic: message['message']['profilePic'],
                        vm: message["message"]);
                  } else {
                    return VMRecieved(
                      profilePic: message['userId']['profilePic'],
                      vm: message['message'],
                    );
                  }
                } else {
                  return const SizedBox();
                }
              }).toList(),
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
            child: _waveController.isRecording
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: 52,
                          child: WaveformRecorder(
                            height: 48,
                            controller: _waveController,
                            onRecordingStopped: _onRecordingStopped,
                          ),
                        ),
                        IconButton(
                            onPressed: _onRecodingCanceled,
                            icon: const Icon(Icons.delete)),
                        IconButton(
                            onPressed: _toggleRecording,
                            icon: const Icon(Icons.send_rounded)),
                      ],
                    ),
                  )
                : TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: 'Type a message',
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: _toggleRecording,
                            icon: const Icon(Icons.mic),
                            color: Colors.blue,
                            iconSize: 24,
                          ),
                          IconButton(
                            onPressed: _sendAsset,
                            icon: const Icon(Icons.image_rounded),
                            color: Colors.blue,
                            iconSize: 24,
                          ),
                          IconButton(
                            onPressed: () {
                              if (_messageController.text == "") {
                                return;
                              }
                              widget.onMessageSend!();
                            },
                            icon: const Icon(Icons.send_rounded),
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
