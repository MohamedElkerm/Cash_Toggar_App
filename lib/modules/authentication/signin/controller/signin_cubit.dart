import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/local/cache_helper.dart';
import 'package:cash_toggar_app/helper/local/cache_helper_keys.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../generated/l10n.dart';
import '../../../../helper/global_widgets/global_snack_bar_widget.dart';
import '../../../../resources/colors_manager.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  final formKeyForSigninScreen = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isVisibile = false;

  void changeVisibility() {
    isVisibile = !isVisibile;
    emit(SigninVisibilityChangeState());
  }

  bool signinLoading = false;

  Future<void> signInUsingFirebase(
      {required context, required isArabic}) async {
    if (formKeyForSigninScreen.currentState!.validate()) {
      emit(SigninLoadingState());
      signinLoading = true;

      try {
        // Sign in with email and password
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
            .then((value) {
          myGlobalSnackBarWidget(
            context: context,
            isArabic: isArabic,
            backGroundColor: AppColors.inf_suc_dan_warn_sucess,
            text: S.of(context).signInSuccess,
          );
          CacheHelper.saveData(
            key: CacheHelperKeys.uId,
            value: value.user!.uid,
          );
          navigateToHomeScreen();
          signinLoading = false;
          return value;
        });

        emailController.clear();
        passwordController.clear();
        emit(SigninSuccessState());
      } on FirebaseAuthException catch (e) {
        signinLoading = false;
        // Handle errors
        String errorMessage = 'An error occurred. Please try again.';
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found with this email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Incorrect password.';
        }

        myGlobalSnackBarWidget(
          context: context,
          isArabic: isArabic,
          backGroundColor: AppColors.inf_suc_dan_warn_danger,
          text: errorMessage,
        );
        emit(SigninErrorState());
      }
    }
  }

  void navigateToSignup() {
    router.pushReplacementNamed(
      AppRoutesNamed.signUpScreen,
    );
    emit(SigninNavigateToSignupState());
  }

  void navigateToHomeScreen() {
    router.pushReplacementNamed(
      AppRoutesNamed.homeScreen,
    );
    emit(SigninNavigateToHomeState());
  }

  void navigateToForgetPassword() {
    emit(SigninNavigateToForgetPasswordState());
  }










  // Future<void> addPaymentGateways() async {
  //   // Reference to the Firestore collection
  //   final CollectionReference paymentGateways =
  //   FirebaseFirestore.instance.collection('payment_gateways');
  //
  //   // List of payment gateway records
  //   final List<Map<String, dynamic>> records = [
  //     {
  //       "isEnable": true,
  //       "isVisible": true,
  //       "image":
  //       "https://firebasestorage.googleapis.com/v0/b/notes-10271.appspot.com/o/payment_ways%2Fbmonline.png?alt=media&token=caf836cb-c057-4d90-86ab-a3227c357dac",
  //       "title": "محفظه BM",
  //       "titleEn": "BM Online",
  //       "titleForTransaction": "ادخل رقم المحفظه",
  //       "titleForTransactionEn": "enter wallet number",
  //       "transactionMethod": "01014754786",
  //     },
  //     {
  //       "isEnable": true,
  //       "isVisible": true,
  //       "image":
  //       "https://firebasestorage.googleapis.com/v0/b/notes-10271.appspot.com/o/payment_ways%2Fetisalat_cash.png?alt=media&token=998216ae-ceee-40cf-a574-742ff924d3e7",
  //       "title": "اتصالات كاش",
  //       "titleEn": "Etisalat Cash",
  //       "titleForTransaction": "ادخل رقم المحفظه",
  //       "titleForTransactionEn": "enter wallet number",
  //       "transactionMethod": "01254856987",
  //     },
  //     {
  //       "isEnable": true,
  //       "isVisible": true,
  //       "image":
  //       "https://firebasestorage.googleapis.com/v0/b/notes-10271.appspot.com/o/payment_ways%2Finstapay_cash.png?alt=media&token=47ab6787-020a-42ce-a264-7d0f9c73b7e1",
  //       "title": "انستا باي",
  //       "titleEn": "Instapay",
  //       "titleForTransaction": "عنوان الحساب @",
  //       "titleForTransactionEn": "Account adress@",
  //       "transactionMethod": "@instapayuser",
  //     },
  //     {
  //       "isEnable": true,
  //       "isVisible": true,
  //       "image":
  //       "https://firebasestorage.googleapis.com/v0/b/notes-10271.appspot.com/o/payment_ways%2Forange_cash.png?alt=media&token=09d40f3a-dace-4fc7-be51-d43ca5735b30",
  //       "title": "اورانج كاش",
  //       "titleEn": "Orange Cash",
  //       "titleForTransaction": "ادخل رقم المحفظه",
  //       "titleForTransactionEn": "enter wallet number",
  //       "transactionMethod": "01514258745",
  //     },
  //     {
  //       "isEnable": true,
  //       "isVisible": true,
  //       "image":
  //       "https://firebasestorage.googleapis.com/v0/b/notes-10271.appspot.com/o/payment_ways%2Fwepay_cash.png?alt=media&token=a961d000-de2d-487f-8d36-227a51309968",
  //       "title": "محفظه وي",
  //       "titleEn": "WE Pay",
  //       "titleForTransaction": "ادخل رقم المحفظه",
  //       "titleForTransactionEn": "enter wallet number",
  //       "transactionMethod": "01514258745",
  //     },
  //   ];
  //
  //   // Add each record to Firestore
  //   for (final record in records) {
  //     await paymentGateways.add(record);
  //   }
  //
  //   print('5 payment gateways added successfully!');
  // }


}
