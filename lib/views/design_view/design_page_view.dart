import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import '../../widgets/custom_widget_helper.dart';
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
            body: Scaffold(
              appBar: customAppBarSmall(context),
                backgroundColor: AppColor.appColorMain,
                body: Stack(
                  children: [
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
                        child: ListView(
                      children: [
                        const Gap(25),
                        SizedBox(
                            height: customHeight(context, percentage: 0.73),
                            width: customWidth(context),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      customHeight(context, percentage: 0.675),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Stack(
                                            children: [
                                              Image.asset("assets/abaya.png"),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon:
                                                        Icon(Icons.fullscreen)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Fabric",
                                      style: TextStyle(
                                          color: AppColor.appColorBlack,
                                          fontSize: 16),
                                    ),
                                    const Gap(15),
                                    SizedBox(
                                      height: customHeight(context,
                                          percentage: 0.12),
                                      width: customWidth(context,
                                          percentage: 0.35),
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: customHeight(
                                                    context,
                                                    percentage: 0.005),
                                                mainAxisSpacing: customHeight(
                                                    context,
                                                    percentage: 0.005)),
                                        itemCount: model.colors.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: model.colors[index],
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Sizes",
                                      style: TextStyle(
                                          color: AppColor.appColorBlack,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: customHeight(context,
                                          percentage: 0.12),
                                      width: customWidth(context,
                                          percentage: 0.35),
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: customHeight(
                                                    context,
                                                    percentage: 0.005),
                                                mainAxisSpacing: customHeight(
                                                    context,
                                                    percentage: 0.005)),
                                        itemCount: model.sizes.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Center(
                                                child: LimitedBox(
                                              child: AutoSizeText(
                                                model.sizes[index],
                                                minFontSize: 16,
                                                maxFontSize: 18,
                                                maxLines: 1,
                                              ),
                                            )),
                                            decoration: BoxDecoration(
                                                color: AppColor
                                                    .appColorGreylight
                                                    .withOpacity(0.6),
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Colors",
                                      style: TextStyle(
                                          color: AppColor.appColorBlack,
                                          fontSize: 16),
                                    ),
                                    const Gap(15),
                                    SizedBox(
                                      height: customHeight(context,
                                          percentage: 0.12),
                                      width: customWidth(context,
                                          percentage: 0.35),
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: customHeight(
                                                    context,
                                                    percentage: 0.005),
                                                mainAxisSpacing: customHeight(
                                                    context,
                                                    percentage: 0.005)),
                                        itemCount: model.colors.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: model.colors[index],
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Accessories",
                                      style: TextStyle(
                                          color: AppColor.appColorBlack,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: customHeight(context,
                                          percentage: 0.2),
                                      width: customWidth(context,
                                          percentage: 0.35),
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: customHeight(
                                                    context,
                                                    percentage: 0.005),
                                                mainAxisSpacing: customHeight(
                                                    context,
                                                    percentage: 0.005)),
                                        itemCount: model.accessories.length - 7,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: model.accessories[index],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ))
                  ],
                ))));
  }
}
