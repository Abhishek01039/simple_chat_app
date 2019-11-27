import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _data = [];

  final String name = "Pawan kumar";

  final _textController = new TextEditingController();

  _submitted(String text) {
    _textController.clear();
    setState(() {
      _data.insert(0, text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 200,
        child: Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            reverse: true,
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(name[0]),
                ),
                title: Text(name),
                subtitle: Text(_data[index]),
              );
            },
          ),
        ),
        // Divider(),
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: "Enter Message"),
                  controller: _textController,
                  onSubmitted: (text) {
                    _textController.clear();
                    setState(() {
                      _data.add(text);
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _submitted(_textController.text),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
