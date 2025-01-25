import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

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

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));

    emit(CopyTheUserNumberIdState());
  }


  bool getUserDataLoading = false;
  late UserModel userModel ;
  Future<UserModel?> getUserData(String uId) async {
    try {
      getUserDataLoading = true;

      emit( GetTheUserDataLoadingState());
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
        emit( GetTheUserDataSuccessState());
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        // Return null if the document does not exist
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the process
      getUserDataLoading = false;
      print('Error fetching user data: $e');
      emit( GetTheUserDataErrorState());
      throw e; // Re-throw the error if you want to handle it elsewhere
    }
  }
}
