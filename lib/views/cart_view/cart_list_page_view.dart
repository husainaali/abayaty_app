import 'package:abayaty_app/routes/routes.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import '../../widgets/custom_widget_helper.dart';
import 'cart_page_view_model.dart';

class CartListPageView extends StatelessWidget {
  const CartListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartPageViewModel>.reactive(
        viewModelBuilder: () => CartPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) =>  Scaffold(
          bottomNavigationBar:  Container(
            height: customHeight(context,percentage: 0.14),
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total:20.0 BHD',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'VAT (10%): 2.0 BHD',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Final Price: 22.0 BHD',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    
                    onPressed: () {
                      // Handle check out logic
                    },
                    child: Text('Check Out',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 12.0,
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
        
       
                 appBar: customAppBarBig(context,model,"Cart"),
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
                        itemCount: 2,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Container(
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
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: Image.asset(
                                                  "assets/background.png",
                                                  fit: BoxFit.cover,
                                                  height: customHeight(context,
                                                      percentage: 0.16),
                                                  width: customHeight(context,
                                                      percentage: 0.16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                         Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LimitedBox(
                                              child: AutoSizeText("Eid Abaya",
                                                  maxFontSize: 20, minFontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            LimitedBox(
                                              child: AutoSizeText(
                                                "Regular collection",
                                                maxFontSize: 12,
                                                minFontSize: 6,
                                              ),
                                            ),
                                            
                                            
                                          ],
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(right: 16.0),
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
                                                      "8.9",
                                                      minFontSize: 28,
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

                                 Transform.scale(
                                          scale: 0.6,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              IconButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStateProperty.all(
                                                          AppColor
                                                              .appColorBlack),
                                                ),
                                                onPressed: () {
                                                  model.itemQtyCounter("-");
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  color: AppColor.appColorWhite,
                                                ),
                                              ),
                                              SizedBox(
                                                  width: customWidth(context,
                                                      percentage: 0.18),
                                                  height: customHeight(context,
                                                      percentage: 0.05),
                                                  child: Center(
                                                      child: LimitedBox(
                                                          child: AutoSizeText(
                                                    model.itemQty.toString(),
                                                    maxFontSize: 36,
                                                    minFontSize: 24,
                                                  )))),
                                              IconButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStateProperty.all(
                                                          AppColor
                                                              .appColorBlack),
                                                ),
                                                onPressed: () {
                                                  model.itemQtyCounter("+");
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  color: AppColor.appColorWhite,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                              ],
                            ),
                          );
                        })),
              ],
            )
                )
                );
                
  }
}
