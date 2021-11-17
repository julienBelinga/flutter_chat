import 'dart:developer' as developper;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class LoginPage extends StatefulWidget {
const LoginPage({Key? key}) : super(key: key);

@override
_LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
TextEditingController tecUsername = TextEditingController();
TextEditingController tecPassword = TextEditingController();
@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
child:Padding(
padding: const EdgeInsets.all(25.0),
child: Column(
children: [
const Spacer(),
TextFormField(controller: tecUsername, decoration: const InputDecoration(hintText: 'username', prefixIcon: Icon(Icons.person)),),
TextFormField(controller: tecPassword, obscureText: true, decoration: const InputDecoration(hintText: 'password', prefixIcon: Icon(Icons.password)),),
const Spacer(),
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
ElevatedButton(onPressed: _login, child: const Text("SE CONNECTER")),
OutlinedButton(onPressed: ()=> Navigator.of(context).pushNamed('/register'), child: const Text("S'INSCRIRE")),

],),
],
),
) ,
),
);
}
_login() async{
String username = tecUsername.text.trim();

String password = tecPassword.text.trim();

Response response = await http.post(
Uri.parse("https://flutter-learning.mooo.com/auth/local/"),
body:{
"identifier" : username,
"password" : password,
}
);
if(response.statusCode == 200){
  developper.log("Login done with sucess ${response.statusCode}");
  Navigator.of(context).pushNamed("/home_page");
}else{
  developper.log("Login done with error ${response.statusCode}");
  developper.log("Register done with error ${response.body.toString()}");
}

}
}