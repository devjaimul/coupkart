import 'package:coup_kart/helpers/prefs_helper.dart';
import 'package:coup_kart/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:coup_kart/global_widgets/app_logo.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/utils/app_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
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
                key: formKey, // Linking the form to the key
                child: Column(
                  spacing: sizeH * .02,
                  children: [
                    CustomTextOne(text: "Sign In"),
                    CustomTextTwo(
                        text: "Welcome Back! Please enter your details."),
                    CustomTextField(
                      controller: emailTEController,
                      autofillHints: const [AutofillHints.email],
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
                      autofillHints: const [AutofillHints.password],
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
                        if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                            .hasMatch(value)) {
                          return "Password must contain letters, numbers, uppercase, and special characters";
                        }
                        return null;
                      },
                    ),
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
                        if (formKey.currentState?.validate() ?? false) {
                          PrefsHelper.setString(AppConstants.isLogged, "true");
                          TextInput.finishAutofillContext();
                          final email = emailTEController.text.trim();
                          final password = passTEController.text.trim();


                          Get.offAllNamed(AppRoutes.customNavBar);
                        }
                      },
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}

