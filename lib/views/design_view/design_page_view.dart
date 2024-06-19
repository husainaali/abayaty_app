import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import 'design_page_view_model.dart';

class DesignPageView extends StatelessWidget {
  const DesignPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DesignPageViewModel>.reactive(
        viewModelBuilder: () => DesignPageViewModel(),
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