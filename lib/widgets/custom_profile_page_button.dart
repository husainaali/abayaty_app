part of 'custom_widget_helper.dart';

ElevatedButton customButton(context,title,onPressed){
  return ElevatedButton(

                    child: Text(
                      title,
                      style: TextStyle(
                          color: AppColor.appColorBlack, fontSize: 18),
                    ),
                    style: ButtonStyle(
                alignment: Alignment.centerLeft,
                        minimumSize: WidgetStateProperty.all(Size(
                            customWidth(context, percentage: 0.8),
                            customHeight(context, percentage: 0.08))),
                        side: WidgetStateProperty.all(
                            BorderSide(color: AppColor.appColorBlack)),
                        backgroundColor: WidgetStateProperty.all(
                            AppColor.appColorBlack.withOpacity(0))),
                    onPressed: () {
                      onPressed();
                    },
                  );
}