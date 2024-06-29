part of 'custom_widget_helper.dart';

Widget bottomNavigationBar(BuildContext context, WrapperViewModel model) {
  return Container(
    color: Color(0),
    height: customHeight(context, percentage: 0.12),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          height: customHeight(context, percentage: 0.08),
          width: customWidth(context, percentage: 0.92),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  model.pageSelector(0);
                },
                icon: SvgPicture.asset(
                  "assets/home.svg",
                  color: model.selectedItem == 0
                      ? AppColor.appColorWhite
                      : AppColor.appColorGreyDark,
                ),
              ),
              IconButton(
                onPressed: () {
                  model.pageSelector(1);
                },
                icon: SvgPicture.asset(
                  "assets/pentool.svg",
                  color: model.selectedItem == 1
                      ? AppColor.appColorWhite
                      : AppColor.appColorGreyDark,
                ),
              ),
              IconButton(
                onPressed: () {
                  model.pageSelector(2);
                },
                icon: SvgPicture.asset(
                  "assets/person.svg",
                  color: model.selectedItem == 2
                      ? AppColor.appColorWhite
                      : AppColor.appColorGreyDark,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: customHeight(context, percentage: 0.02),
        )
      ],
    ),
  );
}
