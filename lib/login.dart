import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class _LoginData {
  String username = '';
  String password = '';
}


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final String _urlLogin = "https://www.frenchy-ponies.fr/ucp.php?mode=login";
  final String _urlToken = "https://www.frenchy-ponies.fr/ponybox/pb-include.php";
  final Dio dio = new Dio();
  _LoginData _data = new _LoginData();

  void login() async {
    dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
    dio.options.baseUrl = "https://www.frenchy-ponies.fr/";
    dio.post("ucp.php?mode=login", data: {
      'username':_data.username,
      'password':_data.password,
      'login':'Connexion'
    }).then((response){
      //dio.get(_urlToken).then((Response response){
        //print(response.data.toString());
      //});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Builder(
        builder: (context) =>  new Center(
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                    onSaved: (value) {
                      this._data.username = value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: 'Username',
                        labelText: 'Username'
                    )
                ),
                new TextFormField(
                    onSaved: (value) {
                      this._data.password = value;
                    },
                    obscureText: true, // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password'
                  )
                ),
                new Container(
                  margin: new EdgeInsets.only(
                      top: 20.0
                  ),
                  child: new RaisedButton(
                    child: new Text(
                      'Login',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      _formKey.currentState.save();
                      login();
                    },
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}