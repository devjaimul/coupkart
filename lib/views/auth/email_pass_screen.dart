import 'package:coup_kart/global_widgets/app_logo.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/helpers/prefs_helper.dart';
import 'package:coup_kart/routes/exports.dart';
import 'package:coup_kart/utils/app_constant.dart';
import 'package:coup_kart/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../global_widgets/custom_text.dart';

class EmailPassScreen extends StatelessWidget {
  EmailPassScreen({super.key});
  final TextEditingController emailTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                child: Form(
                  key: formKey,
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email cannot be empty";
                          }
                          if (!AppConstants.emailValidate.hasMatch(value)) {
                            return "Invalid email address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeH * .1,
                      ),
                      CustomTextButton(
                          text: "Send Otp",
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              PrefsHelper.setString(AppConstants.isLogged, "true");
                              Get.to(OtpVerificationScreen(
                                isFormForget: true,
                              ));
                            }
                          }),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
