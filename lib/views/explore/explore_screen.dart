import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/routes/exports.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/views/explore/explore_view_screen.dart';
import 'package:flutter/material.dart';


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: CustomTextOne(text: "Explore"),
      bottom: PreferredSize(preferredSize: Size.fromHeight(sizeH*.07),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:sizeH*.02),
            child: CustomTextField(controller: TextEditingController(),hintText: "Search For Places",
            prefixIcon: Padding(
              padding:  EdgeInsets.symmetric(horizontal: sizeW*.02),
              child: Icon(Icons.search,color: AppColors.primaryColor,),
            ),
            ),
          )),
      ),
      body: Padding(
        padding:  EdgeInsets.all(sizeH*.02),
        child: Column(
          spacing: sizeH*.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: sizeW*.01,
              children: [
                Icon(Icons.location_pin,color: AppColors.primaryColor,),
                CustomTextOne(text: "Trending Places"),
              ],
            ),
            SizedBox(height: sizeH*.01,),
            InkWell(onTap: (){Get.to(()=>ExploreViewScreen());}, child: CustomTextTwo(text: "Cayman Brac ",color: AppColors.primaryColor,)),
            InkWell(onTap: (){Get.to(()=>ExploreViewScreen());}, child: CustomTextTwo(text: "Cayman Brac ",color: AppColors.primaryColor,)),
            InkWell(onTap: (){Get.to(()=>ExploreViewScreen());}, child: CustomTextTwo(text: "Cayman Brac ",color: AppColors.primaryColor,)),
            InkWell(onTap: (){Get.to(()=>ExploreViewScreen());}, child: CustomTextTwo(text: "Cayman Brac ",color: AppColors.primaryColor,)),
            InkWell(onTap: (){Get.to(()=>ExploreViewScreen());}, child: CustomTextTwo(text: "Cayman Brac ",color: AppColors.primaryColor,)),

          ],
        ),
      ),

    );
  }
}
