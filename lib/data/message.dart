import 'user.dart';

class Message {
  int id;
  String format;
  int type;
  bool isPrivate;
  User from;
  User to;
  String channel;
  int sendDate;

  Message.fromJson(dynamic oJson){
    this.id = oJson['id'];
    this.format = oJson['format'];
    this.type = oJson['type'];
    this.sendDate = oJson['sendDate'];

    this.from = User.fromJson(oJson['from']);

    if(oJson['to'] != null){
      this.to = User.fromJson(oJson['to']);
    }

    this.channel = oJson["channel"];
    this.isPrivate = oJson["private"];
  }
}