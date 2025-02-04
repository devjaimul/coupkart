import 'package:coup_kart/global_widgets/app_logo.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/utils/app_constant.dart';
import 'package:coup_kart/utils/app_icons.dart';
import 'package:coup_kart/views/profile/setting/terms_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_text_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: sizeH * .03,
                    children: [
                      CustomTextOne(text: "Create Account"),
                      CustomTextTwo(
                          text:
                              "Fill the information to create a new account."),
                      CustomTextField(
                        controller: nameTEController,
                        hintText: "Enter Your Name",
                        isEmail: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Image.asset(
                            AppIcons.person,
                            height: 18.h,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                      ),
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
                      Obx(() => Row(
                            children: [
                              Checkbox(
                                value: rememberMe.value,
                                onChanged: (value) {
                                  rememberMe.value = value!;
                                },
                              ),
                              const CustomTextTwo(text: "Agree with"),
                              InkWell(
                                  onTap: () {
                                    Get.to(() => TermsScreen());
                                  },
                                  child: const CustomTextTwo(
                                    text: " Terms of Services",
                                    color: AppColors.primaryColor,
                                  )),
                            ],
                          )),
                      CustomTextButton(
                          text: "Sign UP",
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              Get.toNamed(AppRoutes.otpVerificationScreen);
                            }
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextTwo(text: "Already have an account?"),
                          StyleTextButton(
                            text: "Sign In",
                            onTap: () {
                              Get.toNamed(AppRoutes.signInScreen);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
