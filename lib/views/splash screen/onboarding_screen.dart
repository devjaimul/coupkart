import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart'; // Import the package
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});


  List<PageViewModel> getPages() {

    return [

      PageViewModel(
        title: "WELCOME to COUPKART",
        body: "Get more and more hot deals and discounts on food and restaurant near you!",
        image: Image.asset(AppImages.onboarding1, width: 350.w,),
        decoration: PageDecoration(
          pageColor: Colors.white,
          bodyAlignment: Alignment.center, // Centering the text
          imageAlignment: Alignment.center, // Centering the image
          imagePadding: EdgeInsets.all(20.w),
        ),
      ),
      // Onboarding Page 2
      PageViewModel(
        title: "Enjoy your NIGHT",
        body: "Get more and more hot deals and discounts near you!",
        image: Align(
          alignment: Alignment.center,
          child: Image.asset(AppImages.onboarding2, width: 350.w),
        ),
        decoration: PageDecoration(
          pageColor: Colors.white,
          bodyAlignment: Alignment.center, // Centering the text
          imageAlignment: Alignment.center, // Centering the image
          imagePadding: EdgeInsets.all(20.w),
        ),
      ),
      // Onboarding Page 3
      PageViewModel(
        title: "Great Deals on Activity",
        body: "Get more and more hot deals and discounts on activities near you!",
        image: Align(
          alignment: Alignment.center,
          child: Image.asset(AppImages.onboarding3, width: 350.w),
        ),
        decoration: PageDecoration(
          pageColor: Colors.white,
          bodyAlignment: Alignment.center, // Centering the text
          imageAlignment: Alignment.center, // Centering the image
          imagePadding: EdgeInsets.all(20.w),
        ),
      ),
      // Onboarding Page 4
      PageViewModel(
        title: "Enjoy Events In Least cost",
        body: "Get more and more hot deals and discounts on events near you!",
        image: Align(
          alignment: Alignment.center,
          child: Image.asset(AppImages.onboarding4, width: 350.w),
        ),
        decoration: PageDecoration(
          pageColor: Colors.white,
          bodyAlignment: Alignment.center, // Centering the text
          imageAlignment: Alignment.center, // Centering the image
          imagePadding: EdgeInsets.all(20.w),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
        pages: getPages(),
        onDone: () {
          Get.offAllNamed(AppRoutes.customNavBar);

        },
        onSkip: () {
       Get.offAllNamed(AppRoutes.customNavBar);
        },
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Icon(Icons.arrow_forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),

        dotsDecorator: DotsDecorator(
          size: Size(10.0.w, 10.0.h),
          color: AppColors.primaryColor.withOpacity(0.5),
          activeSize: Size(22.0.w, 10.0.h),
          activeColor: AppColors.primaryColor,
          spacing: EdgeInsets.symmetric(horizontal: 3.0.w),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
