import 'package:cash_toggar_app/modules/bottom_nav_modules/home/controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../helper/global_widgets/sliver_widgets/custom_sliver_app_bar.dart';

class ChoosePaymentMethodScreen extends StatelessWidget {
  const ChoosePaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var homeCubit = BlocProvider.of<HomeCubit>(context);
          return CustomScrollView(
            slivers: [
              MyDefaultCustomSliverAppBarScreen(
                headerTitle: homeCubit.isSendingProcess
                    ? S.of(context).sendingMoneyProcess
                    : S.of(context).receiveMoneyProcess,
                refreshFunction: () {},
                backFunction: () {},
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
