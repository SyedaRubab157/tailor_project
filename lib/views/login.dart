import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_project/constants/palette.dart';
import 'package:tailor_project/controllers/login_controller.dart';
import 'package:get/get.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    LoginController _loginController=Get.put(LoginController());
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.1),
              child: Form(
                key: _loginController.FormKey,
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller:_loginController.emailController ,
                    decoration:const InputDecoration(
                      hintText: 'Phone '
                          'Number/ Email',
                      prefixIcon: Icon(
                        Icons.person,
                        color: primary,
                      ),
                      hintStyle: TextStyle(color: Colors.black12),
                    ),
                    enableSuggestions: true,
                  ),
                  TextFormField(
                    controller: _loginController.passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: primary,
                      ),
                      hintStyle: TextStyle(color: Colors.black12),
                    ),
                    obscureText: true,
                  ),
                  // Text("Not registered yet?"),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Not registered yet?",
                        style: TextStyle(color: Colors.black26),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.06),
                  ElevatedButton(
                    onPressed: () {

                      _loginController.login();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: primary),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Login",
                        style: MyTextStyles.subHeadingBoldWhite16,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
