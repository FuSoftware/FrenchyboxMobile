import 'package:flutter/material.dart';
import '../data/user.dart';

class UserListWidget extends StatelessWidget{
  final List<User> users;

  UserListWidget(this.users);

  List<Widget> getUsers(){
    List children = new List<Widget>();
    users.forEach((u)=>children.add(new UserWidget(u)));
    return children;
  }

  Widget build(context) {
		return new ListView(
      children: getUsers(),
    );
	}
}

class UserWidget extends StatelessWidget {
  final User user;

  UserWidget(this.user);

  Widget build(context) {
		return new Text(
      this.user.username,
      style: TextStyle(color: Color(this.user.color)),
    );
	}
}