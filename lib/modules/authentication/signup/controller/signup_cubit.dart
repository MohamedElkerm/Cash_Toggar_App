import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool agreeTheConditions = false;
  void changeAgreeTheConditions({required newValue}) {
    agreeTheConditions = newValue;
    emit(SignupAgreeTheConditionsChangeState());
  }

  bool isVisibile = false;
  void changeVisibility() {
    isVisibile = !isVisibile;
    emit(SigninVisibilityChangeState());
  }

}
