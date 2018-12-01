import 'dart:io';
import 'data/message.dart';
import 'data/channel.dart';
import 'data/user.dart';

abstract class Ponybox {
  static const String cb_url = 'https://www.frenchy-ponies.fr:2096';

  String id;
  String token;

  Map<String, Channel> channels;

  Ponybox(this.id,this.token);

  void connect();
  void sendMessage(String channel, String message, String to);
  void joinChannel(String channel);

  void onMessage(Message message){
    channels[message.channel].messages.add(message);
  }

  void onChannelJoined(Channel channel){
    channels[channel.name] = channel;
  }

  void onOlderMessages(Channel channel, List<Message> messages){
    channel.messages.insertAll(0, messages);
  }

  void onNewChannels(List<Channel> channels){
    channels.forEach((c){
      if(this.channels.containsKey(c.name)){
        this.channels[c.name] = c;
      }
    });
  }

  void onChannelUsers(Channel channel, List<User> users){
    channel.users = users;
  }
}

/*

import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'dart:convert';

class Ponybox {
  final String cb_url = 'https://www.frenchy-ponies.fr:2096';
  SocketIO socket;

  String id;
  String token;

  Ponybox(this.id,this.token);

  socketStatus(dynamic data){
    print('$data');
  }

  connect(){
    socket = SocketIOManager().createSocketIO(cb_url, '/', socketStatusCallback: socketStatus);
    socket.init();

    socket.subscribe('login', (_){
      print('login');
    });

    socket.subscribe('login-success', (_){
      print('login-success');
    });

    socket.subscribe('join-channel', (dynamic oChannel){
      print('join-channel : $oChannel');
      sendMessage(oChannel['name'], 'Flutter Test', null);
    });
    
    socket.subscribe('connect', (dynamic data){
      print('Logged in : $data');
      socket.sendMessage('create', json.encode({'id':id, 'token':token}),(dynamic data){
        print('Created : $data');
        socket.sendMessage('login', null);
      });
    });

    socket.subscribe('error', (dynamic data){
      print('Error : $data');
    });

    socket.subscribe('connect_timeout', (dynamic data){
      print('Connection Timeout : $data');
    });

    socket.subscribe('connect_error', (dynamic data) {
      print('Connection Error : $data');
    });

    socket.connect();
  }

  joinChannel(String channel){
    socket.sendMessage('send-message', [channel]);
  }

  sendMessage(String channel, String message, String to){
    if(to == '') to = null;
    socket.sendMessage('send-message', [channel, message, to]);
  }
}
*/