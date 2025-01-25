import 'package:bloc/bloc.dart';
import 'package:cash_toggar_app/helper/local/cache_helper.dart';
import 'package:cash_toggar_app/helper/local/cache_helper_keys.dart';
import 'package:cash_toggar_app/helper/routing/app_routes.dart';
import 'package:cash_toggar_app/helper/routing/router.dart';
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
}
