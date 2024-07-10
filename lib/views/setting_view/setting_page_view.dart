// TODO Implement this library.

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import '../../widgets/custom_widget_helper.dart';
import 'setting_page_view_model.dart';

class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingPageViewModel>.reactive(
        viewModelBuilder: () => SettingPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            appBar: customAppBarBig(context, model, ""),
            backgroundColor: Colors.white,
            body: Stack(children: [
              SizedBox(
                width: Size.infinite.width,
                height: Size.infinite.height,
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/homebackground.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                  child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0,left: 25,right: 25),
                  child: Text(
                    "Setting",
                    style:
                        TextStyle(color: AppColor.appColorBlack, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0,left: 25,right: 25),
                  child: customButton(context,"Profile",(){})
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0,left: 25,right: 25),
                  child: customButton(context,"Notifications Center",(){})
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0,left: 25,right: 25),
                  child: customButton(context,"Terms and Conditions",(){})
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0,left: 25,right: 25),
                  child: customButton(context,"FAQ",(){})
                ),
                Gap(40),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0,left: 25,right: 25),
                  child: customButton(context,"Log Out",(){

                    model.getUserData(context);
                  })
                ),
              ]))
            ])));
  }
}
