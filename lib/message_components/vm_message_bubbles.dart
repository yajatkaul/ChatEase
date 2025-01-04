import 'package:flutter/material.dart';
import 'package:voice_message_package/voice_message_package.dart';

/// Component for voice messages sent in chat
class VMSent extends StatelessWidget {
  /// url of voice message
  final String vm;

  /// url of profile picture of user
  final String profilePic;

  /// required for component
  const VMSent({super.key, required this.vm, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: VoiceMessageView(
                circlesColor: Colors.blue,
                activeSliderColor: Colors.blue,
                controller: VoiceController(
                  audioSrc: vm,
                  onComplete: () {
                    /// do something on complete
                  },
                  onPause: () {
                    /// do something on pause
                  },
                  onPlaying: () {
                    /// do something on playing
                  },
                  onError: (err) {
                    /// do somethin on error
                  },
                  maxDuration: const Duration(seconds: 5000),
                  isFile: false,
                ),
                innerPadding: 12,
                cornerRadius: 20,
              )),
          const SizedBox(
            width: 10,
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
      ),
    );
  }
}

/// Component for voice messages recieved in chat
class VMRecieved extends StatelessWidget {
  /// url of voice message
  final String vm;

  /// url of profile picture of user
  final String profilePic;

  /// required for component
  const VMRecieved({super.key, required this.vm, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
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
          const SizedBox(
            width: 10,
          ),
          Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: VoiceMessageView(
                circlesColor: Colors.black,
                activeSliderColor: Colors.black,
                controller: VoiceController(
                  audioSrc: vm,
                  onComplete: () {
                    /// do something on complete
                  },
                  onPause: () {
                    /// do something on pause
                  },
                  onPlaying: () {
                    /// do something on playing
                  },
                  onError: (err) {
                    /// do somethin on error
                  },
                  maxDuration: const Duration(seconds: 5000),
                  isFile: false,
                ),
                innerPadding: 12,
                cornerRadius: 20,
              )),
        ],
      ),
    );
  }
}
