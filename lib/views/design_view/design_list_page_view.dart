import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import '../../routes/routes.dart';
import '../../widgets/custom_widget_helper.dart';
import 'design_page_view_model.dart';

class DesignListPageView extends StatelessWidget {
  const DesignListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DesignPageViewModel>.reactive(
        viewModelBuilder: () => DesignPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: AppColor.appColorWhite,
            body: Scaffold(
                appBar: customAppBarBig(context, model, ""),
                backgroundColor: AppColor.appColorMain,
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
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing:
                                customHeight(context, percentage: 0.003),
                            mainAxisSpacing:
                                customWidth(context, percentage: 0.003)),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.push(DesignPageViewRoute.path);
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
                                        width: customWidth(context,
                                            percentage: 0.2),
                                        height: customHeight(context,
                                            percentage: 0.26),
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
                                            "assets/abaya.png",
                                            fit: BoxFit.cover,
                                            height: customHeight(context,
                                                percentage: 0.36),
                                            width: customWidth(context,
                                                percentage: 0.48),
                                          ),
                                        ),
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          LimitedBox(
                                            maxWidth: 60,

                                            child: AutoSizeText("My Work Abaya",
                                                maxFontSize: 28,
                                                minFontSize: 14,
                                                maxLines: 2,),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          LimitedBox(
                                            maxWidth: 60,
                                            child: AutoSizeText(
                                              "Created at:12-6-2024 \nLast Modified:15-6-2024",
                                              maxFontSize: 8,
                                              minFontSize: 4,
                                            ),
                                          )
                                        ],
                                      
                                      ),
                                      Gap(10),
                                    ]),
                              ),
                            ),
                          );
                        }),
                  )
                ]))));
  }
}
