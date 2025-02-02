import 'dart:async'; // Correct import for Timer
import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset("assets/images/app_logo.png",height:sizeH* .2,width:sizeW* 1,),
      ),
    );
  }
}
