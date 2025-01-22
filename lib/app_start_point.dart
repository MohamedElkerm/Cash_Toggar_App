import 'package:cash_toggar_app/modules/bottom_nav_modules/home/controller/home_cubit.dart';
import 'package:cash_toggar_app/resources/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'generated/l10n.dart';
import 'helper/localization/cubit/localization_cubit.dart';
import 'helper/routing/router.dart';

class CashToggar extends StatelessWidget {
  const CashToggar({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalizationCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: BlocConsumer<LocalizationCubit, LocalizationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var localizationCubit = BlocProvider.of<LocalizationCubit>(context);
          return MaterialApp.router(
            routerConfig: router,
            locale:
            localizationCubit.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            builder: FToastBuilder(),
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
          );
        },
      ),
    );
  }
}
