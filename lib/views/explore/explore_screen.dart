import 'package:coup_kart/Controller/exolore/explore_controller.dart';
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/custom_text_field.dart';
import 'package:coup_kart/routes/exports.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    final ExploreController controller = Get.put(ExploreController());
    final TextEditingController searchTEController=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(text: "Explore"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Google Map
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(23.759287273526724, 90.42894329783785),
                zoom: 14.0,
              ),
              markers: controller.markers.value,  // Display markers
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController mapController) {
                controller.mapController.complete(mapController);
              },
              onCameraMove: (position) {
                controller.updateCameraPosition(position.target);
              },
            ),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeH * .02, vertical: sizeH * .02),
              child: CustomTextField(
                controller: searchTEController,
                hintText: "Search For Places",
                validator: (value) {},
                filColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search, color: AppColors.primaryColor),
                  onPressed: () {

                    String query = searchTEController.text;
                    controller.searchLocation(query);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
