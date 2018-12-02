import 'package:flutter/material.dart';
import '../data/channel.dart';
import 'message_widget.dart';
import 'user_widget.dart';

class ChannelListWidget extends StatelessWidget{
  final List<Channel> channels;

  ChannelListWidget(this.channels);

  List<Widget> getTabs(){
    List<Widget> tabs = [];
    channels.forEach((c)=>tabs.add(new Text(c.name)));
    return tabs;
  }

  List<Widget> getBody(){
    List<Widget> widgets = [];
    channels.forEach((c)=>widgets.add(new ChannelWidget(c)));
    return widgets;
  }

  Widget build(context) {
    return DefaultTabController(
      length: this.channels.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: getTabs()
          ),
          title: Text('Channels'),
        ),
        body: TabBarView(
          children: getBody(),
        ),
      ),
    );
  }
}

class ChannelWidget extends StatelessWidget {
  final Channel channel;

  ChannelWidget(this.channel);

  Widget build(context) {
		return Scaffold(
      body:MessageListWidget(this.channel.messages),
    );
	}
}