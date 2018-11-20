import 'package:flutter/material.dart';
import '../data/message.dart';
import '../data/user.dart';

class MessageWidget {
  final Message message;

  MessageWidget(this.message);

  Widget build(context) {
		return new Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(this.message.from.avatarUrl),
            Text(message.from.username),
            Text(DateTime.fromMillisecondsSinceEpoch(this.message.sendDate).toString())
          ],
        ),
        Text(message.format)
      ],
    );
	}
}