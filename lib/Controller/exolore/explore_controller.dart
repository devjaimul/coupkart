import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';  // Geocoding package
import 'package:permission_handler/permission_handler.dart'; // Permission handler package
import 'package:geolocator/geolocator.dart';  // Geolocator to fetch current location

class ExploreController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer();
  final RxSet<Marker> markers = <Marker>{}.obs;
  final Rx<LatLng> cameraPosition = LatLng(23.759287273526724, 90.42894329783785).obs;

  // Predefined locations and markers
  @override
  void onInit() {
    super.onInit();
    _initializeMarkers();
    checkLocationPermission();  // Ensure permission is checked on initialization
  }

  void _initializeMarkers() {
    addMarker(LatLng(23.760191144827438, 90.42892503286043), "Ahad Juice Studio");
    addMarker(LatLng(23.759327029665133, 90.42733716514353), "Sagor Chinese Restaurant");
    addMarker(LatLng(23.7567395596166, 90.426559324538963), "Vater Hotel");
  }

  // Add a new marker
  void addMarker(LatLng position, String title) {
    markers.add(
      Marker(
        markerId: MarkerId(title),
        position: position,
        infoWindow: InfoWindow(title: title),
      ),
    );
  }

  // Update camera position
  void updateCameraPosition(LatLng newPosition) {
    cameraPosition.value = newPosition;
  }

  // Request and check location permission
  Future<void> checkLocationPermission() async {
    PermissionStatus permissionStatus = await Permission.location.request();

    if (permissionStatus.isGranted) {
      _getCurrentLocation();
    } else {
      Get.snackbar('Permission Denied', 'Location permission is required for this feature.');
    }
  }

  // Fetch current location of the user
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      LatLng currentLocation = LatLng(position.latitude, position.longitude);

      // Add current location marker
      addMarker(currentLocation, 'You are here');

      // Update camera position to current location
      updateCameraPosition(currentLocation);

      // Optionally, move camera to current location
      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLocation, zoom: 14.0),
      ));
    } catch (e) {
      Get.snackbar('Error', 'Failed to get current location');
    }
  }

  // Search function to add a marker and move camera
  Future<void> searchLocation(String query) async {
    if (query.isNotEmpty) {
      try {
        // Use geocoding to fetch latitude and longitude for the query
        List<Location> locations = await locationFromAddress(query);
        if (locations.isNotEmpty) {
          LatLng searchedLocation = LatLng(locations[0].latitude, locations[0].longitude);

          // Add a marker for the searched location
          addMarker(searchedLocation, query);

          // Update camera position to center on the searched location
          updateCameraPosition(searchedLocation);

          // Optionally, update the camera zoom level
          final GoogleMapController controller = await mapController.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: searchedLocation, zoom: 14.0),
          ));
        } else {
          Get.snackbar(
            'Error',
            'No results found for the search query.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'Location not found. Please try another query.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
