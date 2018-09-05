import 'package:flutter/material.dart';
import 'package:podcast/chat/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final _textEditor = TextEditingController();
  final _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Screen")),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          _buildTextInput(),
        ],
      ),
    );
  }

  Widget _buildTextInput() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textEditor,
                onSubmitted: _onTextSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                onPressed: () => _onTextSubmitted(_textEditor.text),
                icon: Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTextSubmitted(String input) {
    _textEditor.clear();
    _messages.insert(0, ChatMessage(text: input));
    setState(() {});
  }
}
