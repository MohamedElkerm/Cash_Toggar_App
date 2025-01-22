import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'choose_payment_method_state.dart';

class ChoosePaymentMethodCubit extends Cubit<ChoosePaymentMethodState> {
  ChoosePaymentMethodCubit() : super(ChoosePaymentMethodInitial());
}
