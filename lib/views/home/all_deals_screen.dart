import 'package:coup_kart/global_widgets/custom_card.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/views/home/deal_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllDealsScreen extends StatelessWidget {
  final bool? isFood;
  const AllDealsScreen({super.key, this.isFood});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(text:isFood==true?"Food": "All Deals"),
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .7,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5

        ),
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
    );
  }
}
