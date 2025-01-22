import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User ID copied to clipboard!'),
        duration: Duration(seconds: 2),
      ),
    );
    emit(CopyTheUserNumberIdState());
  }
}
