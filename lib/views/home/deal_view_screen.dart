import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_button.dart';
import 'package:coup_kart/helpers/prefs_helper.dart';
import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/routes/exports.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/utils/app_constant.dart';
import 'package:coup_kart/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class DealViewScreen extends StatefulWidget {
  DealViewScreen({super.key}) {
    getData();
  }

  @override
  _DealViewScreenState createState() => _DealViewScreenState();

  String? isLogged;

  void getData() async {
    isLogged = await PrefsHelper.getString(AppConstants.isLogged);
  }
}

class _DealViewScreenState extends State<DealViewScreen> {
  bool isFavorite = false; // To track the favorite state

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(text: "Deal Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .02),
          child: Column(
            spacing: sizeH * .025,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image(
                      image: AssetImage("assets/images/deal2.png"),
                      height: sizeH * .35,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // Toggle the favorite state when clicked
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline, // Change icon based on state
                      color: AppColors.primaryColor,
                      size: sizeH * .05,
                    ),
                  ),
                ],
              ),
              CustomTextTwo(
                text: "20% Off Any 1/2 Jerk Meal With a Drink",
                color: Colors.black,
                fontSize: sizeH * .02,
                fontWeight: FontWeight.w800,
              ),
              Row(
                spacing: sizeW * .005,
                children: [
                  Icon(
                    CupertinoIcons.location_solid,
                    color: AppColors.textColor,
                  ),
                  Expanded(
                      child: CustomTextOne(
                        text: "115B Printer Way",
                        color: AppColors.textColor,
                        fontSize: sizeH * .018,
                        textAlign: TextAlign.start,
                        maxLine: 1,
                        textOverflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
              ReadMoreText(
                "Get a free wrap and Drink with any order of a bowl. Press redeem and show this Coupy Deal to a staff member to redeem.Get a free wrap and Drink with any order of a bowl. Press redeem and show this Coupy Deal to a staff member to redeem.",
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: "show more",
                moreStyle: TextStyle(color: AppColors.primaryColor),
                style: TextStyle(
                    color: AppColors.textColor, fontSize: sizeH * .016),
                trimExpandedText: "show less",
                colorClickableText: AppColors.primaryColor,
              ),
              CustomTextOne(
                text: "Save  \$2",
                color: AppColors.primaryColor,
                fontSize: sizeH * .02,
              ),
              Center(child: CustomTextOne(text: "Redeem 1",fontSize: sizeH*.016,)),
              CustomTextButton(
                text: "Redeem 🎉",
                radius: 50,
                onTap: () {
                  if (widget.isLogged == "true") {
                    print(widget.isLogged);
                    print("===========================hello");
                    _showLoginBottomSheet(context, () {
                      Get.toNamed(AppRoutes.subscriptionScreen);
                    }, "Subscribe");
                  } else {
                    // Show bottom sheet if not logged in
                    _showLoginBottomSheet(context, () {
                      Get.offAllNamed(AppRoutes.signInScreen);
                    }, "Login");
                  }
                },
                color: Colors.black,
              ),
              SizedBox(
                height: sizeH * .01,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show the bottom sheet
  void _showLoginBottomSheet(BuildContext context, Function onTap, String title) {
    final sizeH = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Transparent background
      builder: (BuildContext context) {
        return Container(
          height: sizeH * 0.65,
          decoration: BoxDecoration(
            color: Colors.white, // Bottom sheet color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(sizeH * .03),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          // bottomRight: Radius.circular(8),
                          // bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AppImages.appLogo,
                        height: sizeH * .05,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Image(
                          image: AssetImage(AppImages.close),
                          height: sizeH * .05,
                        ),
                      ),
                    ],
                  )),

              Padding(
                padding: EdgeInsets.all(sizeH * .016),
                child: Column(
                  spacing: sizeH * .016,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextOne(text: 'Try New Places & Save Now'),
                    CustomTextTwo(
                      text: "Just for \$6.99/month",
                      fontWeight: FontWeight.w600,
                    ),
                    customSheetRow(AppImages.exciting, 'Exciting Deals !!'),
                    customSheetRow(
                        AppImages.nearME, 'Find Amazing places near you !'),
                    customSheetRow(AppImages.money, 'Save Money !!'),
                    CustomTextOne(
                      text: title == "Login"
                          ? 'Please Login and Subscribe to enjoy our popular and remarkable deals and save some money today'
                          : 'Please Subscribe to enjoy our popular and remarkable deals and save some money today',
                      fontSize: sizeH * 0.015,
                    ),
                    SizedBox(
                      height: sizeH * .01,
                    ),
                    CustomTextButton(text: title, onTap: onTap)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row customSheetRow(
      String img,
      title,
      ) {
    return Row(
      children: [
        Image(
          image: AssetImage(img),
          height: Get.height * .05,
        ),
        SizedBox(
          width: Get.width * .02,
        ),
        CustomTextTwo(
          text: title,
          color: Colors.black,
        ),
      ],
    );
  }
}
