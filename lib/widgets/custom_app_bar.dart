part of 'custom_widget_helper.dart';

AppBar customAppBarBig(BuildContext context, model,selectedPage) {
  return AppBar(
    actions: [
      selectedPage=="Cart"?Container():IconButton(
      icon: SizedBox(
        height: 30,
        width: 30,
        child: Stack(
          children: [
           
            Center(
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: AppColor.appColorWhite,
              ),
            ),
             Align(
              alignment: Alignment.topRight,
              child: Container(
                child: Center(
                  child: Text("2",style: TextStyle(
                    fontSize: 10,
                    color: Colors.white),),
                ),
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30)),),
            ),
          ],
        ),
      ),
      onPressed: () {
        context.push(CartListPageViewRoute.path);
      },
    ),
    ],
      backgroundColor: Color(0),
      flexibleSpace: Container(
        width: customWidth(context),
        height: customHeight(context, percentage: 0.16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 55,bottom: 10),
          child: Image.asset(
            'assets/abayatysmall_logo.png',
            height: customHeight(context, percentage: 0.05),
          ),
        ),
      ),
      bottom: selectedPage=="home"?PreferredSize(
        preferredSize:
            Size(customWidth(context), customHeight(context, percentage: 0.11)),
        child: SizedBox(
          height: customHeight(context, percentage: 0.08),
          width: customWidth(context),
          child: ListView.builder(
            itemCount: model.catList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: customWidth(context,
                      percentage: model.selectedCat == index ? 0.5 : 0.35),
                  height: customHeight(context,
                      percentage: model.selectedCat == index ? 0.06 : 0.02),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          model.selectedCat == index
                              ? AppColor.appColorBlack
                              : AppColor.appColorGreyDark),
                    ),
                    onPressed: () {
                      model.selectedCat = index;
                      model.notifyListeners();
                    },
                    child: LimitedBox(
                      child: AutoSizeText(
                        model.catList[index],
                        maxLines: 1,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ):PreferredSize(preferredSize:  Size(customWidth(context), customHeight(context, percentage: 0.03)), child: SizedBox()));
}

AppBar customAppBarSmall(BuildContext context) {
  return AppBar(
    backgroundColor: Color(0),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: AppColor.appColorWhite,
      ),
      onPressed: () {
        context.pop();
      },
    ),
    flexibleSpace: PreferredSize(
      preferredSize: Size.fromHeight(customHeight(context, percentage: 0.07)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/abayatysmall_logo.png',
                height: customHeight(context,
                    percentage: 0.04), // Adjust this as needed
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
