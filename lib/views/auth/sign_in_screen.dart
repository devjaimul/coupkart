import 'package:flutter/material.dart';
import 'package:coup_kart/global_widgets/app_logo.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/utils/app_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    RxBool rememberMe = false.obs;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppLogo(),
            SizedBox(
              height: sizeH * .015,
            ),
            Padding(
              padding: EdgeInsets.all(sizeH * .016),
              child: Column(
                spacing: sizeH * .02,
                children: [
                  CustomTextOne(text: "Sign In"),
                  CustomTextTwo(
                      text: " Welcome Back! Please enter your details."),
                  CustomTextField(
                      controller: emailTEController,
                      hintText: "Enter E-mail",
                      isEmail: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Image.asset(
                          AppIcons.email,
                          height: 18.h,
                        ),
                      )),
                  CustomTextField(
                      controller: passTEController,
                      hintText: "Enter Password",
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Image.asset(
                          AppIcons.password,
                          height: 18.h,
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Row(
                            children: [
                              Checkbox(
                                value: rememberMe.value,
                                onChanged: (value) {
                                  rememberMe.value = value!;
                                },
                              ),
                              const CustomTextTwo(text: "Remember Me"),
                            ],
                          )),
                      StyleTextButton(
                        text: "Forget Password?",
                        onTap: () {
                          Get.toNamed(AppRoutes.emailPassScreen);
                        },
                        textDecoration: TextDecoration.none,
                      ),
                    ],
                  ),
                  CustomTextButton(
                      text: "Login",
                      onTap: () {
                        Get.offAllNamed(AppRoutes.customNavBar);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextTwo(text: "Don’t have an account?"),
                      StyleTextButton(
                        text: "Sign Up",
                        onTap: () {
                          Get.toNamed(AppRoutes.signUpScreen);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
