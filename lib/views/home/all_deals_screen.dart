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
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;

    // Define the number of columns based on screen width
    int crossAxisCount = 2;
    if (sizeW >= 650 && sizeW < 900) {
      crossAxisCount = 3; // Tablet size
    } else if (sizeW >= 900) {
      crossAxisCount = 4; // Larger screens (desktop)
    }

    // Adjust aspect ratio based on screen width
    double aspectRatio = (sizeW < 600) ? 0.65 : (sizeW < 900 ? 0.65 : 0.55);

    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(text: isFood == true ? "Food" : "All Deals"),
      ),
      body: SafeArea(  // Wrap with SafeArea to avoid overflow on the top part of the screen
        child: Padding(
          padding: EdgeInsets.all(sizeH * .02),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: aspectRatio, // Adjust based on screen size
              mainAxisSpacing: sizeH * 0.02,  // Vertical spacing between items
              crossAxisSpacing: sizeW * 0.02, // Horizontal spacing between items
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.to(() => DealViewScreen()),
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
      ),
    );
  }
}




