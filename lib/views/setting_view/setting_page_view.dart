// TODO Implement this library.

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'setting_page_view_model.dart';

class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingPageViewModel>.reactive(
      viewModelBuilder: () => SettingPageViewModel(),
      onViewModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [])));
  }
}