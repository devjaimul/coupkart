import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/global_widgets/dialog.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  TextEditingController couponCodeController = TextEditingController();  // Declare controller here

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: CustomTextOne(text: "Coupons"),),
      body: Padding(
        padding: EdgeInsets.all(sizeH * .025),
        child: Container(
          padding: EdgeInsets.all(sizeH * .016),
          height: sizeH * .3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 2),
                blurRadius: 5,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            spacing: sizeH * .025,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Image(image: AssetImage("assets/images/deal2.png"), fit: BoxFit.contain)),
                  SizedBox(width: sizeW * .06),
                  Flexible(
                    child: Column(
                      spacing: sizeH * .01,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextOne(
                          text: "20% Off Any 1/2 Jerk Meal With a Drink",
                          fontSize: sizeH * .018,
                          textAlign: TextAlign.start,
                        ),
                        CustomTextTwo(text: "Pepper Grill & Bar"),
                        CustomTextTwo(text: "Expires In : 14/02/25", color: Colors.red, fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: CustomTextButton(
                  text: "Staff Member Confirm 🎉",
                  onTap: () {
                    verifyCoupon();

                  },
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void verifyCoupon() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final sizeH = MediaQuery.of(context).size.height;
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextOne(text: "Verify Coupon", fontSize: sizeH * .02),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
          content: CustomTextField(
            controller: couponCodeController,
            hintText: "Enter Coupon Code",
            borderColor: AppColors.primaryColor,
          ),
          actions: [
            CustomTextButton(
              text: "Verify",
              onTap: () {
                Get.back();
                Get.snackbar("Success", "You’ve successfully used the coupon!");

              },
            ),
          ],
        );
      },
    );
  }
}

