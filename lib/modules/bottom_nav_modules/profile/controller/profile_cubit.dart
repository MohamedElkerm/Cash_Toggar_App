import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/generated/l10n.dart';
import 'package:cash_toggar_app/helper/global_widgets/global_snack_bar_widget.dart';
import 'package:cash_toggar_app/helper/local/cache_helper.dart';
import 'package:cash_toggar_app/helper/local/cache_helper_keys.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
import 'package:cash_toggar_app/resources/colors_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void signOut() {
    CacheHelper.removeData(
      key: CacheHelperKeys.uId,
    ).then((value) {
      router.replace(
        AppRoutes.signInScreen,
      );
      emit(ProfileSignOut());
    });
  }

  navigateToUserInformationScreen() {
    router.pushNamed(
      AppRoutesNamed.userInformationsScreen,
    );
    emit(NavigateToUserInfoScreen());
  }

  navigateToWalletBalanceScreen() {
    router.replace(
      AppRoutes.homeScreen,
    );
    emit(NavigateToHomeScreen());
  }

  bool sendRestPasswordLoading = false;

  Future<void> sendPasswordResetEmail(
      {required String email,required context,required isArabic}) async {
    sendRestPasswordLoading = true;
    emit(SendRestPasswordLoadingState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      myGlobalSnackBarWidget(
        context: context,
        isArabic: isArabic,
        backGroundColor: AppColors.inf_suc_dan_warn_sucess,
        text: S.of(context).passwordReset,
      );
      sendRestPasswordLoading = false;
      emit(SendRestPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      myGlobalSnackBarWidget(
          context: context,
          isArabic: isArabic,
          backGroundColor: AppColors.inf_suc_dan_warn_danger,
          text: S.of(context).failedMessage);
      sendRestPasswordLoading = false;
      emit(SendRestPasswordErrorState());
      // print('Failed to send password reset email: ${e.message}');
    } catch (e) {
      myGlobalSnackBarWidget(
          context: context,
          isArabic: isArabic,
          backGroundColor: AppColors.inf_suc_dan_warn_danger,
          text: S.of(context).failedMessage);
      sendRestPasswordLoading = false;
      emit(SendRestPasswordErrorState());

      // print('Error: $e');
    }
  }
}
