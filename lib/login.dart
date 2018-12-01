import 'package:flutter/material.dart';
import 'login_controller.dart';
import 'ponybox.dart';
import 'widgets/channel_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String username;
  String password;

  void login() async {
    LoginController.login(username, password).then((dynamic value){
      if(value == null){
        print('Could not login');
      }else{
        ponyboxTest(value['sid'], value['token']);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChannelListWidget(null)));
      }
    });
  }

  void ponyboxTest(String sid, String token){
    //Ponybox p = Ponybox(sid, token);
    //p.connect();
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
                      this.username = value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: 'Username',
                        labelText: 'Username'
                    )
                ),
                new TextFormField(
                    onSaved: (value) {
                      this.password = value;
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