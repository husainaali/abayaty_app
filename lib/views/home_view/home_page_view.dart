import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import 'home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: AppColor.appColorWhite,
            body: SafeArea(
                child: ListView(
                  children: [
              
                  ],
                ))));
  }
}