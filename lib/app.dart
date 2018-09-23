import 'package:flutter/material.dart';
import 'package:podcast/new_list.dart';
import 'package:podcast/podcasts_list.dart';

class PodcastApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JRE Podcast',
      home: PodcastsListScreen(),
    );
  }
}
