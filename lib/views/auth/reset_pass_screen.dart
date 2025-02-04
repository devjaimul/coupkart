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
  ResetPassScreen({super.key});
  final TextEditingController passTEController = TextEditingController();
  final TextEditingController rePassTEController = TextEditingController();
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
                      CustomTextOne(text: "Reset Password"),
                      CustomTextTwo(
                          text: "Password must have 8-10 characters."),
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (value.length < 8) {
                            return "Password must be at least 8 characters and include uppercase, lowercase, numbers, and special characters (e.g., Abc123@!)";
                          }
                          if (!RegExp(
                                  r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                              .hasMatch(value)) {
                            return "Password must contain letters, numbers, uppercase, and special characters";
                          }
                          return null;
                        },
                      ),
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (value != passTEController.text) {
                            return "Password Didn't Match.";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeH * .1,
                      ),
                      CustomTextButton(
                          text: "Reset Password",
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              Get.offAllNamed(AppRoutes.customNavBar);
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
