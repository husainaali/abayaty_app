import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../services/base_model.dart';

class LoginPageViewModel extends BaseModel {
  bool loginFieldsShow = false;
  bool registerFieldsShow = false;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
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
}
