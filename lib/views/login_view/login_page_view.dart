import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:abaya_app/constants/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:abaya_app/routes/routes.dart';
import 'package:abaya_app/views/login_view/registration_page_view.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custom_widget_helper.dart';
import 'login_page_view_model.dart';

class LoginPageView extends StatelessWidget {
  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
      viewModelBuilder: () => LoginPageViewModel(),
      onViewModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: ListView(children: [

              ]))));}}