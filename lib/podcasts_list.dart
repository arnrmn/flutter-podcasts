import 'dart:async';

import 'package:flutter/material.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import "package:http/http.dart" as http;

class PodcastsListScreen extends StatelessWidget {
  final _playlistId = "UUzQUP1qoWDoEbmsQxvdjxgQ";
  final _channelId = "UCzQUP1qoWDoEbmsQxvdjxgQ";

  @override
  Widget build(BuildContext context) {
    _buildPodcasts();

    return Scaffold(body: Center());
  }

  void _buildPodcasts() async {
    final _api = "AIzaSyDU19gWnXyQk8CNq0l4S1BGS7gzDB7ZE1U";
    final client = http.Client();
    final authorizedClient = clientViaApiKey(_api, baseClient: client);
    final youtube = YoutubeApi(authorizedClient);

    youtube.playlistItems.list("snippet", playlistId: _playlistId).then(
        (value) {
      value.items.forEach((item) {
        print(item);
      });
    }, onError: (error) {
      print(error.toString());
    });
  }
}
