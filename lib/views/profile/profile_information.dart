import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/views/profile/profile_update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'Account Information',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: sizeH * .02,
            children: [
              const CustomTextTwo(text: "Name"),
              CustomTextField(
                controller: TextEditingController(),
                hintText: "Lucy",
                readOnly: true,
              ),
              const CustomTextTwo(text: "E-mail"),
              CustomTextField(
                controller: TextEditingController(),
                hintText: "lucyhuntstreasure@hmail.com",
                readOnly: true,
              ),

              SizedBox(
                height: sizeH * .4,
              ),
              // Edit Profile Button
              CustomTextButton(
                text: 'Edit Profile',
                color: Colors.transparent,
                borderColor: AppColors.primaryColor,
                textColor: AppColors.primaryColor,
                onTap: () async {
                  Get.to(ProfileUpdate());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
