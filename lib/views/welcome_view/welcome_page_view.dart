import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'welcome_page_view_model.dart';

class WelcomePageView extends StatelessWidget {
  WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomePageViewModel>.reactive(
      viewModelBuilder: () => WelcomePageViewModel(),
      onViewModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: ListView(children: [

              ]))));}}