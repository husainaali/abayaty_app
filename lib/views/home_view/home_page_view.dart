import 'package:abayaty_app/routes/routes.dart';
import 'package:abayaty_app/widgets/custom_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
            appBar: customAppBarBig(context, model, "home"),
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
                    child: ListView.builder(
                        itemCount: model.abayatList.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.push(ItemDetailsPageViewRoute.path, extra: {
                                      'index': model.abayatList[index].id,
                                    });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: customHeight(context, percentage: 0.16),
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColor.appColorBlack,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 10,
                                      ),
                                    ],
                                    color: AppColor.appColorWhite,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: customHeight(context,
                                            percentage: 0.16),
                                        height: customHeight(context,
                                            percentage: 0.16),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: AppColor.appColorGreylight,
                                              offset: Offset(10, 0),
                                              blurRadius: 10,
                                            ),
                                          ],
                                          color: AppColor.appColorBlack,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            model.abayatList[index].imgPath ??
                                                "assets/background.png",
                                            fit: BoxFit.cover,
                                            height: customHeight(context,
                                                percentage: 0.16),
                                            width: customHeight(context,
                                                percentage: 0.16),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          LimitedBox(
                                            maxWidth: customWidth(context,
                                                percentage: 0.3),
                                            child: AutoSizeText(
                                                model.abayatList[index].name,
                                                maxFontSize: 28,
                                                minFontSize: 22),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          LimitedBox(
                                            maxWidth: customWidth(context,
                                                percentage: 0.3),
                                            child: AutoSizeText(
                                              model.abayatList[index]
                                                  .description,
                                              maxFontSize: 12,
                                              minFontSize: 6,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 16.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LimitedBox(
                                              child: AutoSizeText("Price"),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                LimitedBox(
                                                  child: AutoSizeText(
                                                    "${model.abayatList[index].price}",
                                                    minFontSize: 24,
                                                  ),
                                                ),
                                                LimitedBox(
                                                  child: AutoSizeText(
                                                    "BHD",
                                                    minFontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          );
                        })),
              ],
            )));
  }
}
