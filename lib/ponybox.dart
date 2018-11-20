import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

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
    socket = SocketIOManager().createSocketIO(cb_url, '', socketStatusCallback: socketStatus);
    socket.init();

    socket.subscribe('login', (){
      print('login');
    });

    socket.subscribe('login-success', (){
      print('login-success');
    });

    socket.subscribe('join-channel', (dynamic oChannel){
      print('join-channel : $oChannel');
      sendMessage(oChannel['name'], 'Flutter Test', null);
    });

    socket.connect().then((dynamic data){
      print('Logged in : $data');
      socket.sendMessage('create', [id, token]).then((dynamic data){
        print('Created : $data');
        socket.sendMessage('login', null);
      });
    });
  }

  joinChannel(String channel){
    socket.sendMessage('send-message', [channel]);
  }

  sendMessage(String channel, String message, String to){
    if(to == '') to = null;
    socket.sendMessage('send-message', [channel, message, to]);
  }
}