import 'package:flutter/material.dart';
import '../data/message.dart';
import 'user_widget.dart';
import 'package:http/http.dart' as http;
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

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget(this.message);

  Widget build(context) {
    return ListTile(
      title: header(),
      subtitle: Html(data: message.format), 
      leading: userIcon(),
    );
	}

  Widget tileMessage(){
    return ListTile(
      title: header(),
      subtitle: Html(data: message.format), 
      leading: userIcon(),
    );
  }

  Widget header(){
    return Row(
      children:[
        Expanded(
          child: UserWidget(this.message.from)
        ),
        Text(this.message.date)
      ]
    );
  }

  Widget userIcon() {
    if(this.message.from.avatarUrl == ''){
      return Text("");
    }else{
      return Image.network(this.message.from.avatarUrl, width: 25, height: 25,);
    }
  }
}