import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController{
  static final String url_login = 'https://www.frenchy-ponies.fr/ucp.php?mode=login';
  static final String url_token = 'http://frenchy-ponies.fr/ponybox/pb-include.php';

  static Future<dynamic> login (String username, String password) async {
    var data = {
      'username' : username,
      'password' : password,
      'login' : 'Connexion',
      'redirect' : 'index.php'
    };

    var client = new http.Client();
    http.Response r = await client.post(url_login, body:data, headers: {
      'content-type':'application/x-www-form-urlencoded'
    });

    String cookies = r.headers['set-cookie'];
    String cfduid = cookies.split(';').where((s)=>s.contains('_cfduid')).last.split('=').last;
    String sid = cookies.split(';').where((s)=>s.contains('phpbb_ma_sid')).last.split('=').last;
    String uid = cookies.split(';').where((s)=>s.contains('phpbb_ma_u')).last.split('=').last;

    var c = '_cfduid=$cfduid;phpbb_ma_sid=$sid;phpbb_ma_uid=$uid;phpbb_ma_k=';
    var resp = await client.get(url_token, headers: {'cookie' : c });

    return resp.body == '' ? null : json.decode(resp.body);
  }
}