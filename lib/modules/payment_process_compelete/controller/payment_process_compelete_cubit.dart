import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/global_widgets/global_snack_bar_widget.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../generated/l10n.dart';
import '../model/payment_gateway_model.dart';

part 'payment_process_compelete_state.dart';

class PaymentProcessCompeleteCubit extends Cubit<PaymentProcessCompeleteState> {
  PaymentProcessCompeleteCubit() : super(PaymentProcessCompeleteInitial());

  GlobalKey<FormState> formKeyGlobalKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late String currentPaymentWayName;
  late String currentPaymentWayImage;

  getCurrentPaymentWayDetails({
    required String currentPaymentWayNameNewValue,
    required String currentPaymentWayImageNewValue,
  }) {
    currentPaymentWayName = currentPaymentWayNameNewValue;
    currentPaymentWayImage = currentPaymentWayImageNewValue;
    emit(UpdateTheCurrentDetailsState());
  }

  void navigateToPaymentProcessCompleteScreen({
    required BuildContext context,
    required String currentPaymentWayNameNewValue,
    required String currentPaymentWayImageNewValue,
  }) {
    getCurrentPaymentWayDetails(
      currentPaymentWayNameNewValue: currentPaymentWayNameNewValue,
      currentPaymentWayImageNewValue: currentPaymentWayImageNewValue,
    );
    router.pushNamed(
      AppRoutesNamed.paymentProcessCompleteScreen,
    );
    emit(NavigateToPaymentProcessCompleteScreen());
  }

  void navigateToPaymentConfirmationScreen({
    required BuildContext context,
  }) {
    router.goNamed(
      AppRoutesNamed.confirmationRequestScreen,
    );
    emit(NavigateToPaymentConfirmationScreen());
  }

  void navigateToHomeScreen({
    required BuildContext context,
  }) {
    router.pop();
    emit(NavigateToPaymentConfirmationScreen());
  }

  // List<Map<String, dynamic>> paymentGatewaysList = [];
  // Future<List<Map<String, dynamic>>> getAllPaymentGateways() async {
  //   try {
  //     getPaymentLoading = true;
  //     emit(GetAllPaymentGateWaysLoadingState());
  //     final CollectionReference paymentGateways =
  //     FirebaseFirestore.instance.collection('payment_gateways');
  //
  //     final QuerySnapshot querySnapshot = await paymentGateways.get();
  //     paymentGatewaysList = querySnapshot.docs
  //         .map((doc) => doc.data() as Map<String, dynamic>)
  //         .toList();
  //
  //     print("paymentGatewaysList.length");
  //     print(paymentGatewaysList.length);
  //     print(paymentGatewaysList);
  //     getPaymentLoading = false;
  //     emit(GetAllPaymentGateWaysSuccessState());
  //     return paymentGatewaysList;
  //   } catch (e) {
  //     getPaymentLoading = false;
  //     // Handle any errors that occur during the process
  //     print('Error fetching payment gateways: $e');
  //     emit(GetAllPaymentGateWaysErrorState());
  //     throw e; // Re-throw the error if you want to handle it elsewhere
  //   }
  // }

  late PaymentGateway currentPaymentGateWay;

  bool getPaymentLoading = false;
  List<PaymentGateway> paymentGatewaysList = [];

  Future<List<PaymentGateway>> getAllPaymentGateways() async {
    try {
      getPaymentLoading = true;
      emit(GetAllPaymentGateWaysLoadingState());

      final CollectionReference paymentGateways =
          FirebaseFirestore.instance.collection('payment_gateways');

      // Fetch all documents from the collection
      final QuerySnapshot querySnapshot = await paymentGateways.get();

      // Map documents to PaymentGateway objects
      paymentGatewaysList = querySnapshot.docs
          .map((doc) =>
              PaymentGateway.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      getPaymentLoading = false;
      emit(GetAllPaymentGateWaysSuccessState());
      return paymentGatewaysList;
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error fetching payment gateways: $e');
      getPaymentLoading = false;
      emit(GetAllPaymentGateWaysErrorState());
      throw e; // Re-throw the error if you want to handle it elsewhere
    }
  }

  bool sendReceivingMoneyLoading = false;

  Future<void> sendReceivingMoneyRecord({
    required String uId,
    required String userId,
    required String userName,
    required String email,
    required BuildContext context,
  }) async {
    if (formKeyGlobalKey.currentState!.validate()) {
      try {
        sendReceivingMoneyLoading = true;
        emit(SendingMoneyLoadingState());
        // Reference to the Firestore collection
        final CollectionReference receivingMoney =
            FirebaseFirestore.instance.collection('receiving_money');

        // Add a new document to the collection
        await receivingMoney.add({
          'amount': priceController.text.trim(),
          'receive_phone': phoneController.text.trim(),
          'uId': uId,
          'userId': userId,
          'user_name': userName,
          'time': DateTime.now(),
          // Firestore will automatically handle DateTime
          'payment_method': currentPaymentGateWay.title,
          'payment_method_en': currentPaymentGateWay.titleEn,
          'status': 'pending',
          'email': email,
        });
        navigateToPaymentConfirmationScreen(
          context: context,
        );
        emit(SendingMoneySuccessState());
        sendReceivingMoneyLoading = false;

        print('Record added successfully!');
      } catch (e) {
        // Handle any errors that occur during the process
        print('Error adding record: $e');
        sendReceivingMoneyLoading = false;

        emit(SendingMoneyErrorState());

        throw e; // Re-throw the error if you want to handle it elsewhere
      }
    }
  }

  final ImagePicker _picker = ImagePicker();
  late File? compressedFile;

  Future<void> pickAndCompressImage({required context}) async {
    emit(CompressImageLoadingState()); // Emit loading state

    try {
      // Pick and compress the image
      compressedFile = await _pickAndCompressImage();

      if (compressedFile != null) {
        selectedFile = true;
        emit(CompressImageSuccessState()); // Emit success state
      } else {
        emit(PickImageErrorState()); // Emit error state
      }
    } catch (e) {
      emit(CompressImageErrorState()); // Emit error state
      print('Error picking or compressing image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick or compress image: $e')),
      );
    }
  }

  Future<File?> _pickAndCompressImage() async {
    try {
      // Pick an image from the gallery
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (pickedFile == null) {
        return null;
      }

      // Check file type and size
      final File file = File(pickedFile.path);
      final String fileExtension =
          pickedFile.path.split('.').last.toLowerCase();
      if (fileExtension != 'jpg' &&
          fileExtension != 'jpeg' &&
          fileExtension != 'png') {
        throw Exception('Only JPG, JPEG, and PNG files are allowed.');
      }

      final int fileSizeInBytes = await file.length();
      const int maxSizeInBytes = 20 * 1024 * 1024; // 20 MB
      if (fileSizeInBytes > maxSizeInBytes) {
        throw Exception('Image size must be less than 20 MB.');
      }

      // Compress the image
      return await compressImage(file);
    } catch (e) {
      throw e;
    }
  }

  Future<File?> compressImage(File file) async {
    try {
      final String targetPath = '${file.path}_compressed.jpg';
      final XFile? compressedFile =
          await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        quality: 70,
      );

      if (compressedFile == null) {
        throw Exception('Failed to compress image.');
      }

      return File(compressedFile.path);
    } catch (e) {
      throw e;
    }
  }

  // required String uId,
  // required String userId,
  // required String userName,
  // required String email,
  // required BuildContext context

  bool sendSendingMoneyLoading = false;
  bool selectedFile = false;

  Future<void> sendSendingMoneyRecord({
    required String uId,
    required String userId,
    required String userName,
    required String email,
    required BuildContext context,
    required bool isArabic,
  }) async {
    print("======================");
    if (formKeyGlobalKey.currentState!.validate()) {
      if (selectedFile) {
        try {
          sendSendingMoneyLoading = true;
          if (compressedFile == null) {
            throw Exception(
                'No compressed image found. Please pick and compress an image first.');
          }

          emit(
              UploadingMoneyLoadingState()); // Emit loading state for sending money

          // Step 1: Upload the image to Firebase Storage
          final String imageUrl =
              await uploadImageToFirebaseStorage(compressedFile!, context);

          // Step 2: Add a new document to the "sending_money" collection
          final CollectionReference sendingMoney =
              FirebaseFirestore.instance.collection('sending_money');

          await sendingMoney.add({
            'amount': priceController.text.trim(),
            'receive_phone': phoneController.text.trim(),
            'uId': uId,
            'userId': userId,
            'user_name': userName,
            'email': email,
            'time': DateTime.now(),
            // Firestore will automatically handle DateTime
            'payment_method': currentPaymentGateWay.title,
            'payment_method_en': currentPaymentGateWay.titleEn,
            'status': 'pending',
            'image': imageUrl,
            // Add the image URL to the document
          });
          sendSendingMoneyLoading = false;
          navigateToPaymentConfirmationScreen(
            context: context,
          );
          emit(UploadingMoneySuccessState()); // Emit success state
          print('Record added successfully!');
        } catch (e) {
          sendSendingMoneyLoading = false;

          emit(UploadingMoneyErrorState()); // Emit error state
          print('Error sending record: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send record: $e')),
          );
          throw e; // Re-throw the error if you want to handle it elsewhere
        }
      } else {
        myGlobalSnackBarWidget(
          context: context,
          isArabic: isArabic,
          backGroundColor: AppColors.inf_suc_dan_warn_danger,
          text: S.of(context).imageValidator,
        );
      }
    }
  }

//
// Function to upload an image to Firebase Storage and return the download URL
  Future<String> uploadImageToFirebaseStorage(File? imageFile, context) async {
    try {
      // emit(UploadingImageLoadingState()); // Emit loading state for image upload

      // Generate a unique file name for the image
      final String fileName =
          'sending_money_images/${DateTime.now().millisecondsSinceEpoch}.${compressedFile!.path.split('.').last.toLowerCase()}';

      // Upload the file to Firebase Storage
      final Reference storageReference =
          FirebaseStorage.instance.ref().child(fileName);
      final UploadTask uploadTask = storageReference.putFile(imageFile!);

      // Wait for the upload to complete
      final TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      emit(UploadingImageSuccessState()); // Emit success state
      return downloadUrl;
    } catch (e) {
      emit(UploadingImageErrorState()); // Emit error state
      print('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
      throw e; // Re-throw the error if you want to handle it elsewhere
    }
  }
}
