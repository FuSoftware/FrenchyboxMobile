import 'package:flutter/material.dart';
import 'channel_widget.dart';
import 'user_widget.dart';
import '../ponybox.dart';

class PonyboxWidget extends StatefulWidget {
  final Ponybox ponybox;

  PonyboxWidget(this.ponybox);

  @override
  _PonyboxWidgetState createState() => _PonyboxWidgetState();
}

class _PonyboxWidgetState extends State<PonyboxWidget> {

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Ponybox")),
      body: ChannelListWidget(widget.ponybox.channelList),
      drawer: Drawer(

      ),
    );
  }
}