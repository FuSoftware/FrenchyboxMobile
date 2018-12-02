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
  String date;

  Message.fromJson(dynamic oJson){
    this.id = oJson['id'];
    this.format = oJson['format'];
    this.type = oJson['type'];
    this.sendDate = oJson['sendDate'];

    this.date = DateTime.fromMillisecondsSinceEpoch(this.sendDate).toString();
    this.date = date.substring(0, date.length-4);

    this.from = User.fromJson(oJson['from']);

    if(oJson['to'] != null){
      this.to = User.fromJson(oJson['to']);
    }

    this.channel = oJson["channel"];
    this.isPrivate = oJson["private"];
  }
}