import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
      return Container(child: Text("LoginPage"),decoration: BoxDecoration(color: Colors.blue,));
  }
}
