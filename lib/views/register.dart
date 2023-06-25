import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../constants/palette.dart';
import '../controllers/login_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        child: Column(children: [
Text("Register Here",),
          TextFormField(decoration: InputDecoration(hintText: 'Firm name',)),
          TextFormField(decoration: InputDecoration(hintText: 'First name',)),
          TextFormField(decoration: InputDecoration(hintText: 'Last name',)),
          TextFormField(decoration: InputDecoration(hintText: 'Email',)),
          TextFormField(decoration: InputDecoration(hintText: 'Phone Number',)),
        ],),
      )
    );
  }
}
