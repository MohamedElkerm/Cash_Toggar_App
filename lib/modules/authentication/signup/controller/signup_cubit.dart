import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/global_widgets/MyResponsiveText.dart';
import 'package:cash_toggar_app/helper/global_widgets/global_snack_bar_widget.dart';
import 'package:cash_toggar_app/helper/local/cache_helper.dart';
import 'package:cash_toggar_app/helper/local/cache_helper_keys.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:cash_toggar_app/resources/fonts_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../generated/l10n.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final formKeyForSignupScreen = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool signUpLoading = false;
  bool agreeTheConditions = false;

  void changeAgreeTheConditions({required newValue}) {
    agreeTheConditions = newValue;
    emit(SignupAgreeTheConditionsChangeState());
  }

  Future<void> signUpUsingFirebase({
    required context,
    required bool isArabic,
  }) async {
    emit(SignupLoadingState());
    if (formKeyForSignupScreen.currentState!.validate()) {
      try {
        signUpLoading = true;
        // Create user with email and password
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
            .then((value) {
          CacheHelper.saveData(
            key: CacheHelperKeys.uId,
            value: value.user!.uid,
          );
          print("sign up response : ${value.user!.uid} ");
          return value;
        });

        // Get the UID from the created user
        String uId = userCredential.user!.uid;
        String userId = uId.substring(0, 7);

        // Add user details to Firestore
        await FirebaseFirestore.instance.collection('users').doc(uId).set({
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'phoneNumber': phoneController.text,
          'uId': uId,
          'userId': userId,
          "createdAt": FieldValue.serverTimestamp(),
          "myCash": 0,
          "myPoints": 0
        }).then((value) {
          print("sign in res");
          return value;
        });

        myGlobalSnackBarWidget(
          context: context,
          isArabic: isArabic,
          backGroundColor: AppColors.inf_suc_dan_warn_sucess,
          text: S.of(context).signUpSuccess,
        );

        navigateToHomeScreen(
          context: context,
        );

        // Clear the form
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        phoneController.clear();
        passwordController.clear();
        emit(SignupSuccessState());
      } on FirebaseAuthException catch (e) {
        signUpLoading = false;


        myGlobalSnackBarWidget(
          context: context,
          isArabic: isArabic,
          backGroundColor: AppColors.inf_suc_dan_warn_danger,
          text: S.of(context).signUpError,
        );
        emit(SignupErrorState());
      }
    }
  }

  bool isVisibile = false;

  void changeVisibility() {
    isVisibile = !isVisibile;
    emit(SigninVisibilityChangeState());
  }

  void navigateToSignInScreen({required BuildContext context}) {
    router.pushReplacementNamed(
      AppRoutesNamed.signInScreen,
    );
    emit(NavigateToSigninScreenState());
  }

  void navigateToHomeScreen({required BuildContext context}) {
    router.pushReplacementNamed(
      AppRoutesNamed.homeScreen,
    );
    emit(NavigateToSigninScreenState());
  }
}
