import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/utils/app_images.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(
          text: "Subscription",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: sizeH*.02,
            children: [
              // Subscription Icon
              Image.asset(
                AppImages.hand,
                height: sizeH * 0.15,
                width: sizeW * 0.5,
                fit: BoxFit.contain,
              ),
        
              // Subscription Title
              CustomTextOne(
                text: "Cayman Is Hard",
              ),
        
        
              // Subscription Description
              CustomTextTwo(
                text:
                "Save money where you can. Join CoupKart Today and save at your favorite places in the Cayman Islands.",
        
              ),
        
        
              // Subscription Plan
              Container(
                padding: EdgeInsets.all(sizeH * 0.035),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
        spacing: sizeH*.02,
                  children: [
                    CustomTextOne(
                      text: "Standard",
                      color: AppColors.primaryColor,
                    ),
                    CustomTextOne(
                      text: "\$9.99/month",
                      color: AppColors.primaryColor,
                    ),
                   Divider(color: AppColors.primaryColor,),
                    // Features List
                    Column(
                      spacing: sizeH*.005,
                      children: [
                        _buildFeatureText("Exclusive Deals"),
                        _buildFeatureText("Event Giveaways"),
                        _buildFeatureText("Save Money"),
                        _buildFeatureText("Discover Places"),
                      ],
                    ),
                    CustomTextTwo(text: "You Can’t Beat It !!",color: Colors.white,),
        
        
                    // Call to Action Button
                    CustomTextButton(
                      text: "Subscribe",
                      borderColor: Colors.transparent,
                      onTap: () {
                        // Add your subscription logic here
                      },
        
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom method for building feature text with a checkmark
  Widget _buildFeatureText(String feature) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(width: 10),
        CustomTextOne(
          text: feature,
          fontSize: 16,
          color: Colors.white,
        ),
      ],
    );
  }
}
