import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/global_widgets/global_snack_bar_widget.dart';
import 'package:cash_toggar_app/helper/local/cache_helper.dart';
import 'package:cash_toggar_app/helper/local/cache_helper_keys.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/model/user_model.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../generated/l10n.dart';
import '../model/money_record_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  late bool isSendingProcess;

  /// if value = 1 -> sending     value = 0 -> receiving
  void changeTheValueOfIsSendingProcessState({required bool newValue}) {
    isSendingProcess = newValue;
    emit(ChangeTheValueOfIsSendingProcessState());
  }

  navigateToChoosePaymentMethod(
      {required BuildContext context, required bool value}) {
    router.pushNamed(
      AppRoutesNamed.choosePaymentMethodScreen,
    );

    changeTheValueOfIsSendingProcessState(
      newValue: value,
    );
    emit(NavigateToChoosePaymentMethodState());
  }

  void copyToClipboard(BuildContext context, String text, isArabic) {
    Clipboard.setData(ClipboardData(text: text));
    myGlobalSnackBarWidget(
      context: context,
      isArabic: isArabic,
      backGroundColor: AppColors.inf_suc_dan_warn_sucess,
      text: S.of(context).copySuccess,
    );
    emit(CopyTheUserNumberIdState());
  }

  bool getUserDataLoading = false;
  late UserModel userModel;

  Future<UserModel?> getUserData(String uId) async {
    try {
      getUserDataLoading = true;

      emit(GetTheUserDataLoadingState());
      // Reference to the Firestore collection
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Fetch the user document using the uId
      final DocumentSnapshot userDoc = await users.doc(uId).get();

      // Check if the document exists
      if (userDoc.exists) {
        // Map the document to a User object
        userModel = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);

        print(userModel.email);

        getUserDataLoading = false;
        emit(GetTheUserDataSuccessState());
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        // Return null if the document does not exist
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the process
      getUserDataLoading = false;
      print('Error fetching user data: $e');
      emit(GetTheUserDataErrorState());
      throw e; // Re-throw the error if you want to handle it elsewhere
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late List<MoneyRecord> allRecords = [];

  // Fetch all records from "sending_money" and "receiving_money" collections based on uId
  Future<List<MoneyRecord>> getUserMoneyRecords(String uId) async {
    print("Startttttttttttttttttttttt !");
    allRecords = [];
    emit(GetTheUserMoneyRecordsLoadingState());
    try {
      // Fetch records from "sending_money" collection
      final QuerySnapshot sendingMoneySnapshot = await _firestore
          .collection('sending_money')
          .where('uId', isEqualTo: uId)
          .get();

      // Fetch records from "receiving_money" collection
      final QuerySnapshot receivingMoneySnapshot = await _firestore
          .collection('receiving_money')
          .where('uId', isEqualTo: uId)
          .get();

      // Combine the results from both collections
      final List<MoneyRecord> sendingMoneyRecords = sendingMoneySnapshot.docs
          .map((doc) => MoneyRecord.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      final List<MoneyRecord> receivingMoneyRecords = receivingMoneySnapshot
          .docs
          .map((doc) => MoneyRecord.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      receivingMoneyRecords.sort((a, b) => b.time.compareTo(a.time));

      if (receivingMoneyRecords.isNotEmpty) {
        if (receivingMoneyRecords[0].status == "pending") {
          CacheHelper.saveData(
              key: CacheHelperKeys.lastReceivingRequestDone, value: false);
        } else {
          CacheHelper.saveData(
              key: CacheHelperKeys.lastReceivingRequestDone, value: true);
        }
      } else {
        CacheHelper.saveData(
            key: CacheHelperKeys.lastReceivingRequestDone, value: true);
      }

      // Combine both lists
      allRecords = [
        ...sendingMoneyRecords,
        ...receivingMoneyRecords,
      ];

      // Sort records by time (most recent first)
      allRecords.sort((a, b) => b.time.compareTo(a.time));

      emit(GetTheUserMoneyRecordsSuccessState());
      return allRecords;
    } catch (e) {
      print('Error fetching money records: $e');
      emit(GetTheUserMoneyRecordsErrorState());
      throw e; // Re-throw the error if you want to handle it elsewhere
    }
  }

  String formatFirebaseTimestamp(DateTime dateTime) {
    String formattedDate = DateFormat('dd/MM/yyyy - hh:mm a').format(dateTime);
    // emit( FormatFirebaseTimestampState());

    return formattedDate;
  }

  String getTimeOfDay() {
    // Get the current time
    DateTime now = DateTime.now();
    int hour = now.hour; // Extract the hour (0-23)

    // Determine if it's morning or night
    if (hour < 12) {
      return "morning";
    } else {
      return "night";
    }
  }

  late int thousandNumbers;
  late int remainderPoints;

  sendCashBack({
    required int currentPoints,
    required BuildContext context,
    required bool isArabic,
    required uId,
  }) {
    emit(SendCashBackLoadingState());
    if (currentPoints >= 1000) {
      calculateThousandsAndRemainder(currentPoints);
      updateUserPointsAndUserCash(
        uId: uId,
        points: remainderPoints,
        cash: thousandNumbers * 10.0,
      );
    } else {
      myGlobalSnackBarWidget(
        context: context,
        isArabic: isArabic,
        backGroundColor: AppColors.inf_suc_dan_warn_danger,
        text: S.of(context).pointsNotEnough,
      );
      emit(SendCashBackErrorState());
    }
  }

  Future<void> updateUserPointsAndUserCash({
    required String uId,
    required int points,
    required double cash,
  }) async {
    emit(SendCashBackLoadingState());

    try {
      DocumentReference userRef = _firestore.collection('users').doc(uId);

      // Get the current myCash value
      DocumentSnapshot userDoc = await userRef.get();
      if (userDoc.exists) {
        double currentCash = (userDoc.get('myCash') ?? 0).toDouble();
        double newCash = currentCash + cash;

        // Update both myPoints and myCash
        await userRef.update({
          'myPoints': points,
          'myCash': newCash,
        });
      }
      getUserData(
        uId,
      );
      emit(SendCashBackSuccessState());
    } catch (e) {
      print('Error updating points and cash: $e');
      emit(SendCashBackErrorState());
    }
  }

  calculateThousandsAndRemainder(int currentPoints) {
    thousandNumbers = 0;
    remainderPoints = 0;

    thousandNumbers =
        currentPoints ~/ 1000; // Calculate how many 1000s are in the price
    remainderPoints = currentPoints % 1000; // Calculate the remainder

    // return thousands * 10;

    // Print the results
    // print("**********************************");
    // print("thousands : ");
    // print(thousands);
    // print("remainder : ");
    // print(remainder);
    // print("fullTax : ");
    // print(fullTax);
    // print("**********************************");
  }
}
