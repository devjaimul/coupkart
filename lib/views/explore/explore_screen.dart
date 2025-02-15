import 'package:coup_kart/Controller/exolore/explore_controller.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/routes/exports.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final ExploreController controller = Get.put(ExploreController());
    final TextEditingController searchTEController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(text: "Explore"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeH * .02, vertical: sizeH * .01),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: searchTEController,
                  decoration: InputDecoration(
                    hintText: "Search For Places",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
                  ),
                  onSubmitted: (query) {
                    controller.searchLocation(query);
                  },
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            // Fixed Google Map
            Container(
              height: sizeH * 0.35, // Fixed height for the map (35% of screen height)
              margin: EdgeInsets.symmetric(horizontal: sizeH * .02),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(23.759287273526724, 90.42894329783785),
                    zoom: 14.0,
                  ),
                  markers: controller.markers.value,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController mapController) {
                    controller.mapController.complete(mapController);
                  },
                  onCameraMove: (position) {
                    controller.updateCameraPosition(position.target);
                  },
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Scrollable List
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sizeH * .02),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Trending Places
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.primaryColor),
                          SizedBox(width: 8),
                          CustomTextOne(
                            text: "Trending Places",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      // Place List
                      ...[
                        "Cayman Brac",
                        "Pico Taqueria",
                        "Peppers",
                        "Rubis",
                        "Al La Kebabs",
                      ].map((place) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CustomTextOne(
                          text: place,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

