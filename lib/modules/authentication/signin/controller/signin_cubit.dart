import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

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
