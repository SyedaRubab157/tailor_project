import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;


class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> FormKey = GlobalKey();

  RxBool loading = false.obs;

  Future<void> login() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1));
    try {
      var headers = {"Content-Type": "application/json"};
      var body = {
        "email": '${emailController.text.trim()}',
        "password": '${passwordController.text.trim()}'
      };
      http.Response response = await http.post(
          Uri.parse("http://server.darjee.one/api/user/login"),
          headers: headers,
          body: json.encode(body));
      print("object ${response.body}");
      Fluttertoast.showToast(
          msg: response.body.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
      } else {
        print('fail');
      }
      loading.value = false;
    } catch (e) {
      print(e);
    }
    loading.value = false;
  }
}
