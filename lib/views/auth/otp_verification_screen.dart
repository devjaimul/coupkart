import 'package:coup_kart/global_widgets/app_logo.dart';
import 'package:coup_kart/global_widgets/custom_pin_code_textfiled.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class OtpVerificationScreen extends StatelessWidget {
final bool? isFormForget;
  const OtpVerificationScreen({super.key, this.isFormForget,});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpTEController = TextEditingController();

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
                  CustomTextOne(text: "OTP"),
                  CustomTextTwo(
                      text:
                      "Please enter the OTP code, We’ve sent you in your mail."),
                  CustomPinCodeTextField(
                    textEditingController: otpTEController,
                  ),
                  StyleTextButton(text: "Didn’t receive the code?", onTap: (){}),
                  SizedBox(
                    height: sizeH * .1,
                  ),
                  CustomTextButton(text: "Confirm", onTap: (){
                    if(isFormForget==true){
                    Get.toNamed(AppRoutes.resetPassScreen);
                    }
                    else{
                      Get.offAllNamed(AppRoutes.customNavBar);
                    }
                    
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
