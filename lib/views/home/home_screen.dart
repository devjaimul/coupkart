import 'package:coup_kart/global_widgets/custom_card.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/utils/app_images.dart';
import 'package:coup_kart/views/home/all_deals_screen.dart';
import 'package:coup_kart/views/home/deal_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextOne(text: "Hello 👋"),
            CustomTextOne(
              text: "Henry Johnson",
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizeH * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: sizeH*.01,
            children: [
              CustomTextOne(
                text: "Explore Your Deals!!",
                fontSize: sizeH * .02,
              ),

              SizedBox(
                height: sizeH * 0.15,  // Adjust height as needed
                child: ListView.builder(

                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Get.to(()=> AllDealsScreen(isFood: true,));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(sizeH * .008),
                        child: Column(
                          spacing: sizeH*.01,
                          children: [
                            Image(
                              image: AssetImage(AppImages.food),
                              height: sizeH * .07,
                              width: sizeW * .2,
                              fit: BoxFit.contain,
                            ),
                            CustomTextTwo(text: "Food"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextOne(
                    text: "Popular Deals",
                    fontSize: sizeH * .02,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(()=> AllDealsScreen());
                    },
                    child: CustomTextOne(
                      fontSize: sizeH * .016,
                      text: "View All",
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sizeH * 0.34,

                child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){Get.to(()=>DealViewScreen());},
                      child: CustomCard(
                        img: "assets/images/deals.png",
                        title: "20% Off Any 1/2 Jerk Meal With a Drink",
                        name: "Pepper Grill & Bar",
                        save: "2",
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextOne(
                    text: "Most Recent",
                    fontSize: sizeH * .02,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(()=> AllDealsScreen());
                    },
                    child: CustomTextOne(
                      text: "View All",
                      fontSize: sizeH * .016,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sizeH * 0.34, // Adjust height as needed
                child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){Get.to(()=>DealViewScreen());},
                      child: CustomCard(
                        img: "assets/images/deal2.png",
                        title: "20% Off Any 1/2 Jerk Meal With a Drink",
                        name: "Pepper Grill & Bar",
                        save: "2",
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
