import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'payment_process_compelete_state.dart';

class PaymentProcessCompeleteCubit extends Cubit<PaymentProcessCompeleteState> {
  PaymentProcessCompeleteCubit() : super(PaymentProcessCompeleteInitial());

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




  bool getPaymentLoading = false;
  List<Map<String, dynamic>> paymentGatewaysList = [];
  Future<List<Map<String, dynamic>>> getAllPaymentGateways() async {
    try {
      getPaymentLoading = true;
      emit(GetAllPaymentGateWaysLoadingState());
      final CollectionReference paymentGateways =
      FirebaseFirestore.instance.collection('payment_gateways');

      final QuerySnapshot querySnapshot = await paymentGateways.get();
      paymentGatewaysList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      print("paymentGatewaysList.length");
      print(paymentGatewaysList.length);
      print(paymentGatewaysList);
      getPaymentLoading = false;
      emit(GetAllPaymentGateWaysSuccessState());
      return paymentGatewaysList;
    } catch (e) {
      getPaymentLoading = false;
      // Handle any errors that occur during the process
      print('Error fetching payment gateways: $e');
      emit(GetAllPaymentGateWaysErrorState());
      throw e; // Re-throw the error if you want to handle it elsewhere
    }
  }





}
