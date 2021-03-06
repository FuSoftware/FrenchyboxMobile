import 'message.dart';
import 'user.dart';

class Channel {
  List<Message> messages;
  List<User> users;
  String name;
  String label;
  bool locked;
  String description;

  Channel.fromJson(dynamic oJson){
    this.name = oJson['name'];
    this.label = oJson['label'];
    this.locked = oJson['locked'];
    this.description = oJson['description'];
  }
}