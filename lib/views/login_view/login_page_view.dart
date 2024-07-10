import 'dart:developer';

import 'package:abayaty_app/constants/constants_helper.dart';
import 'package:abayaty_app/widgets/custom_widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'login_page_view_model.dart';

class LoginPageView extends StatelessWidget {
  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
      viewModelBuilder: () => LoginPageViewModel(),
      onViewModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              width: Size.infinite.width,
              height: Size.infinite.height,
              child: GestureDetector(
                onTap: () {
                  model.registerFieldsShow = false;
                  model.loginFieldsShow = false;
                  model.notifyListeners();
                },
                child: Image.asset(
                  'assets/background.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: customHeight(context, percentage: 0.65),
                child: Column(
                  children: [
                    SizedBox(
                      height: customHeight(context, percentage: 0.15),
                      child: Image.asset(
                        'assets/abayaty_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                height: customHeight(context,
                    percentage: model.loginFieldsShow
                        ? 0.45
                        : model.registerFieldsShow
                            ? 0.8
                            : 0.25),
                width: customHeight(context),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    AnimatedCrossFade(
                      firstChild: Container(),
                      secondChild: Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, bottom: 15.0, left: 15, right: 15),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: model.emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusColor: Colors.black,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: model.emailValidator,
                            ),
                            SizedBox(
                              height: customHeight(context, percentage: 0.02),
                            ),
                            TextFormField(
                              controller: model.loginPassController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                focusColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    model.obscureTextLoginPass
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () => model
                                      .togglePasswordVisibility("LoginPass"),
                                ),
                              ),
                              obscureText: model.obscureTextLoginPass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      crossFadeState: model.loginFieldsShow
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: 300),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: customHeight(context, percentage: 0.03)),
                      child: SizedBox(
                        width: customWidth(context, percentage: 0.85),
                        height: customHeight(context, percentage: 0.06),
                        child: ElevatedButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: AppColor.appColorWhite, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  AppColor.appColorBlack)),
                          onPressed: () {
                            if (model.loginFieldsShow == true) {
                              model.getUserData(context);
                            }
                            model.loginFieldsShow = true;
                            model.registerFieldsShow = false;
                            model.notifyListeners();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: customHeight(context, percentage: 0.02),
                    ),
                    AnimatedCrossFade(
                      firstChild: Container(),
                      secondChild: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 25.0, left: 25, right: 25),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: model.emailController,
                              decoration: InputDecoration(
                                labelText: 'Email/Username',
                                hintText: 'Enter your email/user name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusColor: Colors.black,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: model.emailValidator,
                            ),
                            SizedBox(
                              height: customHeight(context, percentage: 0.01),
                            ),
                            TextFormField(
                              controller: model.registerPassController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                focusColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    model.obscureTextRegisterPass
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () => model
                                      .togglePasswordVisibility("RegisterPass"),
                                ),
                              ),
                              obscureText: model.obscureTextRegisterPass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: customHeight(context, percentage: 0.01),
                            ),
                            TextFormField(
                              controller: model.registerConfirmPassController,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                hintText: 'Enter your confirm password',
                                focusColor: Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    model.obscureTextRegisterConfirmPass
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () =>
                                      model.togglePasswordVisibility(
                                          "RegisterConfirmPass"),
                                ),
                              ),
                              obscureText: model.obscureTextRegisterConfirmPass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: customHeight(context, percentage: 0.01),
                            ),
                            TextFormField(
                              controller: model.mobileController,
                              decoration: InputDecoration(
                                labelText: 'Mobile',
                                hintText: 'Enter your mobile',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusColor: Colors.black,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: model.emailValidator,
                            ),
                            SizedBox(
                              height: customHeight(context, percentage: 0.01),
                            ),
                            TextFormField(
                              controller: model.addressController,
                              decoration: InputDecoration(
                                labelText: 'Address',
                                hintText: 'Enter your address',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusColor: Colors.black,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: model.emailValidator,
                            ),
                            SizedBox(
                              height: customHeight(context, percentage: 0.01),
                            ),
                          ],
                        ),
                      ),
                      crossFadeState: model.registerFieldsShow
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: 300),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: customHeight(context, percentage: 0.03)),
                      child: SizedBox(
                        width: customWidth(context, percentage: 0.85),
                        height: customHeight(context, percentage: 0.06),
                        child: ElevatedButton(
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.black)),
                          onPressed: () {
                            if (model.registerFieldsShow == true) {
                              if (model.emailController.text != "" &&
                                  model.registerPassController.text != "" &&
                                  model.mobileController.text != "" &&
                                  model.addressController.text != "") {
                                Map<String, dynamic> userData = {
                                  "username": "${model.emailController.text}",
                                  "password":
                                      "${model.registerPassController.text}",
                                  "mobile": "${model.mobileController.text}",
                                  "address": "${model.addressController.text}",
                                  "userType": "Admin"
                                };
                                model.saveUserData(context, userData);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Please fill all the fields!"),
                                ));
                              }
                            }
                            model.registerFieldsShow = true;
                            model.loginFieldsShow = false;
                            model.notifyListeners();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
