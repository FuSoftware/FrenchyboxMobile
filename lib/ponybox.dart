import 'package:socket_io_client/socket_io_client.dart';
import 'dart:io';

class Ponybox {
  final String cb_url = 'https://www.frenchy-ponies.fr:2096';
  Socket socket;

  String id;
  String token;

  Ponybox(this.id,this.token);

  socketStatus(dynamic data){
    print('$data');
  }

  connect() async {
    socket = Io.socket(cb_url);

    socket.on('login').listen((Event event){
      print('login');
    });

    socket.on('login-success').listen((Event event){
      print('login-success');
    });

    socket.on('join-channel').listen((Event event){
      print('join-channel : ${event.args}');
      //sendMessage(oChannel['name'], 'Flutter Test', null);
    });

    socket.on(Socket.eventConnect).listen((Event event){
      print('Logged in : ${event.args}');
      socket.emit('create', [id, token]).listen((List<dynamic> args){
        print('Ack from creation : ${args}');
        socket.emit('login', []);
      });
    });

    socket.on(Socket.eventError).listen((Event event){
      print('Error : ${event.args}');
    });

    socket.on(Socket.eventConnectTimeout).listen((Event event){
      print('Connection Timeout : ${event.args}');
    });

    socket.on(Socket.eventConnectError).listen((Event event) {
      print('Connection Error : ${event.args}');
    });

    socket.connect();
  }

  joinChannel(String channel){
    socket.emit('send-message', [channel]);
  }

  sendMessage(String channel, String message, String to){
    if(to == '') to = null;
    socket.emit('send-message', [channel, message, to]);
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