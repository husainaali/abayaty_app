import 'dart:convert';
import 'package:abayaty_app/views/login_view/login_page_view.dart';
import 'package:abayaty_app/views/setting_view/setting_page_view.dart';
import 'package:flutter/material.dart';
import 'package:abayaty_app/routes/routes.dart';
import 'package:abayaty_app/views/home_view/home_page_view.dart';
import 'package:go_router/go_router.dart';

import '../../constants/strings.dart';
import '../../models/user.dart';
import '../../services/locator_service.dart';
import '../../services/shared_preferences_service.dart';
import '../../services/base_model.dart';
import '../design_view/design_list_page_view.dart';
import '../design_view/design_page_view.dart';

class WrapperViewModel extends BaseModel {
  late bool _loggedIn;
  bool get loggedIn => _loggedIn;

  User? userData;

  final SharedPreferenceService _sharedPreferenceService =
      locator.get<SharedPreferenceService>();

  int selectedItem = 1;
  Widget? selectedPage;

  void initialize(BuildContext context) async {
    setBusy(true);
    Map<String, dynamic> userInfo;

    await isLogin().whenComplete(() async {
      await _sharedPreferenceService
          .getStringData(AppString.userData)
          .then((userDataValue) => {
                if (userDataValue != "")
                  {
                    userInfo = json.decode(userDataValue),
                    userData = User.fromJson(userInfo),
                  }
                else
                  {
                    // context.go(LoginPageViewRoute.path),
                  }
              });

      if (userData != null && userData != "") {
        if (userData?.role == 'User') {
          selectedPage = const HomePageView();
          selectedItem = 0;
        } else {
          // selectedPage = const HomeManagerPageView();
          selectedItem = 0;
        }
      } else {
        _loggedIn = true;
      }
      setBusy(false);
      notifyListeners();
    });
  }

  Future<void> pageSelector(index) async {
    if (index == 0) {
      selectedPage = const HomePageView();
      selectedItem = index;
    } else if (index == 1) {
      selectedPage = const DesignListPageView();
      selectedItem = index;
    } else {
      selectedPage = const SettingPageView();
      selectedItem = index;
    }
    notifyListeners();
  }

  Future<void> changePage(BuildContext context) async {
    context.go(WrapperRoute.path);
    notifyListeners();
  }

  Future<void> isLogin() async {
    await _sharedPreferenceService
        .getBoolData("isLogin")
        .then((value) async {
      print(value);
      _loggedIn = value;
      if (_loggedIn) {
        selectedPage = HomePageView();
        selectedItem = 0;
        notifyListeners();
      } else {
        selectedPage = LoginPageView();
        selectedItem = 5;
        notifyListeners();
      }
    });
  }

  Future<void> onNavigationBarTapped(itemIndex) async {
    selectedItem = itemIndex;

    notifyListeners();
  }
}
