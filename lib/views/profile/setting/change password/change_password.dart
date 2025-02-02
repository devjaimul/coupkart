import 'package:coup_kart/global_widgets/app_logo.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPassTEController = TextEditingController();
    TextEditingController passTEController = TextEditingController();
    TextEditingController rePassTEController = TextEditingController();
    final sizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: CustomTextOne(text: "Change Password"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: sizeH * .03,
            children: [
           CustomTextOne(text:"Your Current Password",fontSize: sizeH*.018,),
              CustomTextField(
                  controller: oldPassTEController,
                  hintText: "Current Password",
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Image.asset(
                      AppIcons.password,
                      height: 18.h,
                    ),
                  )),
              CustomTextOne(text:"Enter New Password",fontSize: sizeH*.018,),
              CustomTextField(
                  controller: passTEController,
                  hintText: "New Password",
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Image.asset(
                      AppIcons.password,
                      height: 18.h,
                    ),
                  )),
              CustomTextOne(text:"Re-Enter New Password",fontSize: sizeH*.018,),
              CustomTextField(
                  controller: rePassTEController,
                  hintText: "Re-Enter New Password",
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Image.asset(
                      AppIcons.password,
                      height: 18.h,
                    ),
                  )),
              Align(
                alignment: Alignment.centerRight,
                child: StyleTextButton(text: "Forget Password?", onTap: (){

                }),
              ),
              SizedBox(
                height: sizeH * .1,
              ),
              CustomTextButton (
                  text: "Update Password",
                  onTap: () {
                    Get.offAllNamed(AppRoutes.customNavBar);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
