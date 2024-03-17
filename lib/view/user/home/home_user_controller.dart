import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Home_user extends GetxController {
  var currentAddress = " ".obs;
  Position? currentPosition;

  @override
  void onInit() {
    // TODO: implement onInit
    getCurrentPosition();
    super.onInit();
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Location services are disabled. Please enable the services',
          message: 'User Registered Successfully',
          icon: const Icon(Icons.refresh),
          duration: const Duration(seconds: 3),
        ),
      );
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.showSnackbar(
          GetSnackBar(
            title: "Location permissions are denied",
            message: 'User Registered Successfully',
            icon: const Icon(Icons.refresh),
            duration: const Duration(seconds: 3),
          ),
        );
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.showSnackbar(
        GetSnackBar(
          title:
              "Location permissions are permanently denied, we cannot request permissions.",
          message: 'User Registered Successfully',
          icon: const Icon(Icons.refresh),
          duration: const Duration(seconds: 3),
        ),
      );
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    print("================================================================1");
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      print(currentPosition);
      update();
      print(
          "================================================================2");
      //setState(() => _currentPosition = position);
      getAddressFromLatLng(currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      print(place.country.toString());
      print("+++++++++++++++++++++++");
      currentAddress.value =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      update();
      print("===============================================================" +
          currentAddress.value);
      // setState(() {
      //   _currentAddress =
      //   '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      // });
    }).catchError((e) {
      // debugPrint(e.toString());
    });
  }
}
