import 'package:flutter/material.dart';
import 'login.dart';
import 'widgets/channel_widget.dart';
import 'mockup.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ponybox Mobile',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ponyboxTest(),
    );
  }

  Widget loginWidget(){
    return new LoginPage(title: 'Login to PonyBox');
  }

  Widget ponyboxTest(){
    return ChannelListWidget([Mockup.channel()]);
  }
}