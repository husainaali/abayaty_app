import 'dart:developer';

import 'package:abayaty_app/widgets/custom_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../constants/constants_helper.dart';
import 'home_page_view_model.dart';

class ItemDetailsPageView extends StatelessWidget {
  const ItemDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        onViewModelReady: (model) => model.initializeDetailsPage(),
        builder: (context, model, child) => Scaffold(
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
                              height: customHeight(context, percentage: 0.675),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Image.asset("assets/abaya.png"),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 100, 75, 71),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Gap(20),
                                              Text(
                                                "Price",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                "8.9",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 60,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "BHD",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Gap(20),
                                            ],
                                          ),
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
                                        ElevatedButton(
                                          child: Text(
                                            "Add Cart",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                      Colors.black)),
                                          onPressed: () {},
                                        ),
                                      ],
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
                                  height:
                                      customHeight(context, percentage: 0.12),
                                  width: customWidth(context, percentage: 0.35),
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
                                  height:
                                      customHeight(context, percentage: 0.12),
                                  width: customWidth(context, percentage: 0.35),
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
                                            color: AppColor.appColorGreylight
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
                                  height:
                                      customHeight(context, percentage: 0.12),
                                  width: customWidth(context, percentage: 0.35),
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
                                  height:
                                      customHeight(context, percentage: 0.2),
                                  width: customWidth(context, percentage: 0.35),
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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                                color: AppColor.appColorBlack, fontSize: 16),
                          ),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Elegant Black Abaya with Embellished Details\n\n',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Product Description:\n',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Step into elegance with our luxurious Black Abaya, a timeless piece designed to elevate your wardrobe. This exquisite Abaya is crafted from the finest quality fabric, ensuring not only a stunning look but also unmatched comfort and durability.\n\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Key Features:\n\n',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Premium Fabric:\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Made from a high-quality blend of polyester and silk, this Abaya offers a soft, smooth texture that drapes beautifully. The fabric is lightweight yet substantial, providing a comfortable fit for any occasion.\n\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Intricate Embellishments:\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'The Abaya features delicate embroidery and subtle sequins along the neckline and sleeves, adding a touch of sophistication and glamour. These intricate details are carefully hand-stitched, showcasing exceptional craftsmanship.\n\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Elegant Design:\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'With its classic black color and flowing silhouette, this Abaya is the epitome of elegance. The loose fit ensures modesty while allowing for ease of movement, making it perfect for both everyday wear and special events.\n\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Versatile Styling:\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Pair this Abaya with a matching hijab and statement jewelry for a complete look. Whether you\'re attending a formal gathering or simply running errands, this versatile piece will keep you looking stylish and poised.\n\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Why You\'ll Love It:\n',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Our Black Abaya is not just a piece of clothing; it\'s an experience of luxury and grace. The high-quality fabric feels gentle against the skin, while the detailed embellishments reflect your refined taste. This Abaya is designed to make you feel confident and elegant, no matter where you go.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            )));
  }
}
