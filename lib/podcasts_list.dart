import 'dart:async';

import 'package:flutter/material.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class PodcastsListScreen extends StatelessWidget {
  final _playlistId = "UUzQUP1qoWDoEbmsQxvdjxgQ";
  final _channelId = "UCzQUP1qoWDoEbmsQxvdjxgQ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Widget>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data;
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
          future: _buildPodcasts(),
        ),
      ),
    );
  }

  Future<Widget> _buildPodcasts() async {
    final _credentials = ServiceAccountCredentials.fromJson(r'''
    {
  "type": "service_account",
  "project_id": "jre-podcasts",
  "private_key_id": "21d5287a375c838b200afee03f26a013511a9780",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC49Q619BSBkeX9\nXKpoVx8Fd+ELm/a1ECn+DnOvWI1oI+ZpXzBgVwwhDxuKOe+YEc8FZTrgyGhCUtIX\nvx54lRG/RS5CIWaOurqDw4YIAU3bvjbImMmu2OH8Xc/31FYXv91AS07kJQ2VQowW\n90T6XYQOCEp3Thprs4O6/GvyKVWjM/dngWeVGKNm1ZXUBk76zwPVCW6wO/Pstx8s\nqY5Y4cQxmaOzOUPrWaMzha75CucEpj/y8kFqX1ZL/xSlr6cjjqhAYzpgOogt6aa9\n3aRKqTlQJMglQGezZf6xHjo0eVHGYbodnI1uFCigOBluhmOa8FBbtOYqzGP3HW1v\n0KVMgR67AgMBAAECggEAKgJzOG27eKCQWgdBp1heceoEIhRnKUIGH6/do86bs7Mv\nwvA9dyxeU2XwjelR27rzyBhxkpvCXoocMQuWWrIVKVoHwzp95l5QPdxbpZbSPd6K\n5+4YJRAa6CzQr0w5z8Qi91cDkLs/xg6q7g50yt8RvvQwIcAKLTtFaOOriwHLczlX\n4MLs+nJaKOs8znTaKdhLKBXx7LIeeU0gOtYbYNsHuiCX7m/YSg3xJJQVKLP4kX3g\nVI2VnVRKJYdW0aQYFoZGScyDBfGaKW+lzZTz8nQXdixfvmQyiZlexVSOVt/FJ/vt\nL7L/FjWpb2+LwrHzHqkjaZ6rZHJPa6hq1wL8jEQqcQKBgQDoakZcpyXGJF2Ugpoh\n7CQnzVnDk+WhhAGw2uTCh7wYbcxQvZ2OvhTKK2iyEYUO86J0BgzYtwSCXPVEqLIp\ncq8HxSw56bG9Nnf4sM94szEcjoS5n1jmuJLTgj24q2ezbZHDsmz1v7J9ddDiuLV9\n7+a3QUVOhE6Ylz3Vnv86Kx1tEQKBgQDLuemkBOkuFdeExptL2v0DmJGLyD9BrUIM\npPML3N5+74odDUssqUm2Hph9qRVdYrS9ni6/Ki1SkLmcylFlU/bJgXhA/Y/VZX86\nTgzy39z/Nt3OsDZXJjeFW2n99riVklRXP+MOhia4XQaRBWVYKVoZskrXFT4fD2yZ\nWPfzDwJ/CwKBgAg1sNSXBuuP30perqkiGUjapSAWelcRPaoMoWYJu2g1gLEdcZJY\nPo3BqMoZelTD4GouyIdjN6KPPA630stKBMrGeUB2c9PWN7iuLjX6RnLWyfNwoIhN\n3snf4OREEb6x0SNTiyvHILvzzHQlyCtxrPmuMY+LdudG+GUyX5ujaD+xAoGBAMb/\ngslEQsFRdIOtvGQMNLkefo0bvS5aHvpa5U3hITS8pxxZr+SgN/A9UpbsYoIluIa/\nzMnOWRcdZzFQLtHbgmSyotRY2faIfg5lzyAuq6Bf56nNVkcqfXE2KgJ4zTTNCrVv\nIks9nvTXaWKe8q97NReEoLYXeea9GkdwMEKrlrShAoGAOCJm2NTwc6g/wttzZtC7\na2cRJkrFEfVQ8dLToI58jPgaWHRw7/DAUhaXMzzZMoekSAMzHa0GIimaK/gM+bd2\nZmrbor/0s64XBP68mlHkxMAJhY/WQ55UBj+4u1mQHZ3lX4eqcHObYNQC+sHjZ+fS\njZh32V7w+aqukUhFZCihjoI=\n-----END PRIVATE KEY-----\n",
  "client_email": "jre-podcasts@jre-podcasts.iam.gserviceaccount.com",
  "client_id": "116523657274232118397",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/jre-podcasts%40jre-podcasts.iam.gserviceaccount.com"
}
     ''');

    const _SCOPES = const [YoutubeApi.YoutubeReadonlyScope];

    clientViaServiceAccount(_credentials, _SCOPES).then((client) {
      final api = YoutubeApi(client);

      api.playlistItems
          .list("snippet,contentDetails,status",
              maxResults: 10, playlistId: _playlistId)
          .then((response) {
        print(response.items.toString());
      }).catchError((error) {
        print(error);
      });
    });
  }
}
