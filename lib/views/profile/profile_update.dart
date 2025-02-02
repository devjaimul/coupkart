import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with default values
    nameController.text = "Lucy";
    emailTEController.text = "lucyhuntstreasure@hmail.com";
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: 'Information Edit',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: sizeH * .02,
            children: [
              const CustomTextTwo(text: "Your Name"),
              CustomTextField(
                controller: nameController,
                hintText: "Enter your name",
              ),
              const CustomTextTwo(text: "E-mail"),
              CustomTextField(
                readOnly: true,
                controller: emailTEController,
                hintText: "Enter your email address",
              ),

              SizedBox(
                height: sizeH * .4,
              ),
              // Edit Profile Button
              CustomTextButton(
                text: 'Save',
                onTap: () async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
