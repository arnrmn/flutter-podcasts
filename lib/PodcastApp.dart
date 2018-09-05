import 'package:flutter/material.dart';
import 'package:podcast/chat/ChatScreen.dart';

class PodcastApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JRE Podcast',
      home: ChatScreen(),
    );
  }
}
