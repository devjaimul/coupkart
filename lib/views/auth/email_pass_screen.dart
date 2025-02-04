import 'package:coup_kart/global_widgets/app_logo.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/routes/exports.dart';
import 'package:coup_kart/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../global_widgets/custom_text.dart';

class EmailPassScreen extends StatelessWidget {
   EmailPassScreen({super.key});
 final TextEditingController emailTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  CustomTextOne(text: "Forget Password"),
                  CustomTextTwo(
                      text:
                          "Please enter your email address to reset your password."),
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
                  SizedBox(
                    height: sizeH * .1,
                  ),
                  CustomTextButton(
                      text: "Send Otp",
                      onTap: () {
                        Get.to(OtpVerificationScreen(isFormForget: true,));
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
