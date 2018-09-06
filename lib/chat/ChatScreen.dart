import 'package:flutter/material.dart';
import 'package:podcast/chat/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
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

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();

    super.dispose();
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
    var controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    var message = ChatMessage(text: input, animationController: controller);
    _messages.insert(0, message);
    setState(() {});
    controller.forward();
  }
}
