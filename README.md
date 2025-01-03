# ChatEase: A Prebuilt Feature-Rich Chat Screen for Flutter

[![Pub Popularity](https://img.shields.io/pub/popularity/chatease)](https://pub.dev/packages/chatease)
[![Pub Version](https://img.shields.io/pub/v/chatease)](https://pub.dev/packages/chatease)
[![License](https://img.shields.io/github/license/yajatkaul/chatease)](https://pub.dev/packages/chatease)

**ChatEase** is a Flutter package that provides a prebuilt, feature-rich chat screen designed to simplify development while offering powerful capabilities. With ChatView, you can easily integrate messaging, voice recordings, media sharing, and more into your application, ensuring a seamless and engaging user experience.

## Features 🚀

[![Pub Points](https://img.shields.io/pub/points/chatease)](https://pub.dev/packages/chatease)

- **Rich Messaging**: Send and receive text messages effortlessly.
- **Voice Messaging**: Record and send voice messages with an interactive waveform visualization.
- **Media Sharing**: Share images, videos, and other media assets with ease.
- **Profile Customization**: Personalize user profiles with profile pictures and names.
- **Extensibility**: Add your custom logic with callbacks for sending messages, assets, and voice recordings.

## Demo 🎥

<img src="https://github.com/user-attachments/assets/afa6d9c2-bf4b-4779-8155-c4bf36010cac" alt="Demo" width="300" />

## Installation 🔧

1. Add the dependency to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     chatease: ^1.0.0
   ```

2. Fetch the dependencies:

   ```bash
   flutter pub get
   ```

## Permissions 📜

### Android

Add the following permissions to your AndroidManifest.xml file:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
<uses-permission android:name="android.permission.READ_MEDIA_VIDEO" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

### iOS

Update your Info.plist file with the following permissions to match the functionality:

```xml
<key>NSCameraUsageDescription</key>
<string>Allow access to capture photos and videos.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Allow access to select photos and videos.</string>
<key>NSMicrophoneUsageDescription</key>
<string>Allow access to record audio.</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>Allow saving media to the photo library.</string>
```

Ensure you also enable Background Modes for audio recording if needed.

## Usage 🧑‍💻

1. Import the package:
   ```dart
   import 'package:chatease/chatview.dart';
   ```
2. Use the ChatView widget in your application:
   ```dart
    ChatView(
    messages: conversation,  // List of messages
    conversationId: "123",   // Unique conversation ID
    profilePic: "https://example.com/profile.jpg",
    userName: "User",
    clientId: "1234",        // Current user's ID
    onMessageSend: (message) {
      debugPrint(message);
      setState(() {
        conversation.add(newMessage); // Add new message to the conversation
      });
    },
    onAssetSend: (assets) {
      // Handle media asset sending
    },
    onVMSend: (audio) {
      // Handle voice message sending
    },
   );
   ```

## Example 🥼

```dart
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
```

## Dependencies 🛠️

### ChatEase leverages the following packages to provide its rich feature set:

- [video_player](https://pub.dev/packages/video_player): For playing video messages.
- [waveform_recorder](https://pub.dev/packages/waveform_recorder): For recording voice messages.
- [voice_message_package](https://pub.dev/packages/voice_message_package): For rendering voice messages.
- [wechat_assets_picker](https://pub.dev/packages/wechat_assets_picker): For selecting media assets.
- [flutter_chat_bubble](https://pub.dev/packages/flutter_chat_bubble): For beautiful chat bubbles.
- [image_picker](https://pub.dev/packages/image_picker): For selecting images from the gallery or camera.

## Contributing 🤝

We welcome contributions! If you'd like to improve the package or fix issues:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-name`.
3. Commit your changes: `git commit -m 'Add feature-name'`.
4. Push to the branch: `git push origin feature-name`.
5. Open a Pull Request.

## License 📝

<p>This project is licensed under the MIT License.</p>
<p>Happy coding with ChatEase! 🎉</p>
