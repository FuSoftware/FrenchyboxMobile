import 'package:flutter/material.dart';
import '../data/message.dart';

class MessageListWidget extends StatelessWidget{
  final List<Message> messages;

  MessageListWidget(this.messages);

  List<Widget> getMessages(){
    List children = new List<Widget>();
    messages.forEach((u)=>children.add(new MessageWidget(u)));
    return children;
  }

  Widget build(context) {
		return new ListView(
      children: getMessages(),
    );
	}
}

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget(this.message);

  Widget build(context) {
		return new Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(this.message.from.avatarUrl),
            Text(this.message.from.username),
            Text(DateTime.fromMillisecondsSinceEpoch(this.message.sendDate).toString())
          ],
        ),
        Text(message.format)
      ],
    );
	}
}