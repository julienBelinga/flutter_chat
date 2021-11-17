import 'dart:developer' as developper;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController tecEmail = TextEditingController();
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
            TextFormField(controller: tecEmail, decoration: const InputDecoration(hintText: 'E-mail', prefixIcon: Icon(Icons.email)),),
            TextFormField(controller: tecUsername, decoration: const InputDecoration(hintText: 'username', prefixIcon: Icon(Icons.person)),),
            TextFormField(controller: tecPassword, obscureText: true, decoration: const InputDecoration(hintText: 'password', prefixIcon: Icon(Icons.password)),),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              OutlinedButton(onPressed: ()=> Navigator.of(context).pushNamed("/login"), child: const Text('login')),
              ElevatedButton(onPressed: _register, child: const Text('sign up')),
            ],),
          ],
        ),
      ) ,
      ),
    );
  }

  _register() async{
    String username = tecUsername.text.trim();
    String email = tecEmail.text.trim();
    String password = tecPassword.text.trim();

    Response response = await http.post(
        Uri.parse("https://flutter-learning.mooo.com/auth/local/register"),
        body:{
          "username" : username,
          "email" : email,
          "password" : password,
        }
    );
    if(response.statusCode == 200){
      developper.log("Register done with sucess ${response.statusCode}");
    }else{
      developper.log("Register done with error ${response.statusCode}");
    }

  }
}
