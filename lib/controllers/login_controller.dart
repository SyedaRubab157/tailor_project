import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../views/register.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> FormKey = GlobalKey();
var AuthToken;
  Future<void> login() async {
  try{
    var headers = {"Content-Type": "application/json"};
    var body = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim()
    };

    http.Response response = await http.post(
        Uri.parse("https://server.darjee.one/api/user/login"),
        headers: headers,
        body: jsonEncode(body));
    if(response.statusCode==200){
      var jsonData=jsonDecode(response.body);
      print(jsonData);
    }else{
      print('fail');

    }
  }catch(e){
    print(e);
  }

}}
