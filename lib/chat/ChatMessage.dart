import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final AnimationController animationController;
  final String text;
  final String _name = "Your Name";

  ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: CurvedAnimation(
        curve: Curves.bounceInOut,
        parent: animationController,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text(_name[0]),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _name,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(text),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
