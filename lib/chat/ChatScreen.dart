import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/chat/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textEditor = TextEditingController();
  final _messages = <ChatMessage>[];
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Screen"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Container(
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
                border: Border(
                top: BorderSide(color: Colors.grey[200]),
              ))
            : null,
        child: Column(
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
                onChanged: (String input) {
                  setState(() {
                    _isComposing = input.isNotEmpty;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? CupertinoButton(
                      child: Text("Send"),
                      onPressed: _isComposing
                          ? () => _onTextSubmitted(_textEditor.text)
                          : null,
                    )
                  : IconButton(
                      onPressed: _isComposing
                          ? () => _onTextSubmitted(_textEditor.text)
                          : null,
                      icon: Icon(Icons.send)),
            )
          ],
        ),
      ),
    );
  }

  void _onTextSubmitted(String input) {
    _textEditor.clear();
    _isComposing = false;
    var controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    var message = ChatMessage(text: input, animationController: controller);
    _messages.insert(0, message);
    setState(() {});
    controller.forward();
  }
}
