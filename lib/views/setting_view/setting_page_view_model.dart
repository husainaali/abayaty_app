// TODO Implement this library.


import 'package:abayaty_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/base_model.dart';
import '../../services/locator_service.dart';
import '../wrapper_view/wrapper_view_model.dart';

class SettingPageViewModel extends BaseModel {

    final WrapperViewModel wrapperView = locator.get<WrapperViewModel>();

  initialize() {}



Future<Map<String, dynamic>?> getUserData(BuildContext context) async {
  SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setBool("isLogin",false);
    await wrapperView.isLogin();
    context.pushReplacement(WrapperRoute.path);
}
}