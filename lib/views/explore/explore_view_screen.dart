import 'package:coup_kart/global_widgets/custom_card.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/views/home/deal_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreViewScreen extends StatelessWidget {
  const ExploreViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(text: "Cayman Brac"),
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
