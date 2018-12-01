import 'package:flutter/material.dart';
import '../data/message.dart';
import 'user_widget.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:flutter_html/flutter_html.dart';

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
      padding: EdgeInsets.all(8.0),
      children: getMessages(),
    );
	}
}

/*
class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget(this.message);

  Widget build(context) {
    return Row(
      children:[
        //Image.network(this.message.from.avatarUrl),
        Column(
          children:[
            Row(
              children: <Widget>[
                  UserWidget(this.message.from),
                  Text(DateTime.fromMillisecondsSinceEpoch(this.message.sendDate).toString())
              ],
            ),
            Container (
              width: MediaQuery.of(context).size.width*.95,
              child: Html(
                data: message.format, 
              )
            ),
          ]
        )
      ]
    );
	}
}
*/

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget(this.message);

  Widget build(context) {
    return ListTile(
      title: UserWidget(this.message.from), 
      subtitle: Html(data: message.format), 
      //leading: Image.network(this.message.from.avatarUrl),
    );
	}
}