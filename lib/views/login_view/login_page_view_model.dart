import 'dart:convert';
import 'dart:developer';

import 'package:abayaty_app/routes/routes.dart';
import 'package:abayaty_app/services/locator_service.dart';
import 'package:abayaty_app/views/wrapper_view/wrapper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import '../../services/base_model.dart';
import '../wrapper_view/wrapper_view.dart';

class LoginPageViewModel extends BaseModel {
  bool loginFieldsShow = false;
  bool registerFieldsShow = false;

  final WrapperViewModel wrapperView = locator.get<WrapperViewModel>();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final loginPassController = TextEditingController();
  final registerPassController = TextEditingController();
  final registerConfirmPassController = TextEditingController();
  bool obscureTextRegisterConfirmPass = true;
  bool obscureTextRegisterPass = true;
  bool obscureTextLoginPass = true;
  initialize() {}

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void togglePasswordVisibility(fieldName) {
    switch (fieldName) {
      case "RegisterConfirmPass":
        obscureTextRegisterConfirmPass = !obscureTextRegisterConfirmPass;
      case "RegisterPass":
        obscureTextRegisterPass = !obscureTextRegisterPass;
      case "LoginPass":
        obscureTextLoginPass = !obscureTextLoginPass;
    }
    notifyListeners();
  }

  Future<void> saveUserData(BuildContext context,Map<String, dynamic> userData) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(userData);
    await sharedPreference.setString('${userData["username"]}-userData', jsonString);
    await sharedPreference.setString("logedInUser",jsonString);
    getUserData(context).then((onValue){
      context.go(WrapperRoute.path);
    });

  }

  Future<Map<String, dynamic>?> getUserData(BuildContext context) async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setBool("isLogin",true);
    await wrapperView.isLogin();
    context.pushReplacement(WrapperRoute.path);
}
}
