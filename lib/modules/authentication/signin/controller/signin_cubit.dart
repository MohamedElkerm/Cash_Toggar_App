import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/local/cache_helper.dart';
import 'package:cash_toggar_app/helper/local/cache_helper_keys.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
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
}
