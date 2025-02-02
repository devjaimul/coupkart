import 'package:coup_kart/global_widgets/app_logo.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passTEController = TextEditingController();
    TextEditingController rePassTEController = TextEditingController();
    final sizeH = MediaQuery.of(context).size.height;


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
                spacing: sizeH * .03,
                children: [
                  CustomTextOne(text: "Reset Password"),
                  CustomTextTwo(text: "Password must have 8-10 characters."),
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
                  CustomTextField(
                      controller: rePassTEController,
                      hintText: "Confirm Password",
                      isPassword: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Image.asset(
                          AppIcons.password,
                          height: 18.h,
                        ),
                      )),
                  SizedBox(
                    height: sizeH * .1,
                  ),
                  CustomTextButton(
                      text: "Reset Password",
                      onTap: () {
                        Get.offAllNamed(AppRoutes.customNavBar);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
