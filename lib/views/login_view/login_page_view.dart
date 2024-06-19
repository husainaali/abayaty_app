import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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