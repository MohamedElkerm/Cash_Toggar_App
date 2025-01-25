import 'package:cash_toggar_app/helper/routing/router_observer.dart';
import 'package:cash_toggar_app/modules/authentication/signin/view/signin_screen.dart';
import 'package:cash_toggar_app/modules/authentication/signup/view/sign_up_screen.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/view/home_screen.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/profile/view/profile_screen.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/transactions/view/transaction_screen.dart';
import 'package:cash_toggar_app/modules/choose_payment_method/view/choose_payment_method_screen.dart';
import 'package:cash_toggar_app/modules/onboarding/view/on_boarding_screen.dart';
import 'package:cash_toggar_app/modules/payment_process_compelete/view/payment_process_compelete.dart';
import 'package:cash_toggar_app/modules/user_informations/view/user_informations_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/bottom_nav_bar/view/bottom_nav_bar.dart';
import '../../modules/confirmation_request/view/confirmation_request_screen.dart';
import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // initialLocation: AppRoutes.homeScreen,
  observers: [
    MyRouterObserver(),
  ],
  routes: [
    GoRoute(
      name: AppRoutesNamed.onBoardingScreen,
      path: AppRoutes.onBoardingScreen,
      builder: (context, state) {
        return const OnBoardingScreen();
      },
    ),
    GoRoute(
      name: AppRoutesNamed.signInScreen,
      path: AppRoutes.signInScreen,
      builder: (context, state) {
        return const SigninScreen();
      },
    ),
    GoRoute(
      name: AppRoutesNamed.signUpScreen,
      path: AppRoutes.signUpScreen,
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
    // GoRoute(
    //   name: AppRoutesNamed.homeScreen,
    //   path: AppRoutes.homeScreen,
    //   builder: (context, state) {
    //     return const HomeScreen();
    //   },
    // ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => BottomNavBarScreen(
        navigationShell: navigationShell,
      ),
      branches: [
        ///HOME
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesNamed.homeScreen,
              path: AppRoutes.homeScreen,
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  name: AppRoutesNamed.choosePaymentMethodScreen,
                  path: AppRoutes.choosePaymentMethodScreen,
                  builder: (context, state) =>
                  const ChoosePaymentMethodScreen(),

                ),
                GoRoute(
                  name: AppRoutesNamed.paymentProcessCompleteScreen,
                  path: AppRoutes.paymentProcessCompleteScreen,
                  builder: (context, state) =>
                  const PaymentProcessCompleteScreen(),
                ),
                GoRoute(
                  name: AppRoutesNamed.confirmationRequestScreen,
                  path: AppRoutes.confirmationRequestScreen,
                  builder: (context, state) =>
                  const ConfirmationRequestScreen(),
                ),
              ],

            ),
          ],
        ),

        ///Transaction Page
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesNamed.transactionScreen,
              path: AppRoutes.transactionScreen,
              builder: (context, state) => const TransactionScreen(),
            ),
          ],
        ),

        ///Profile Page
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesNamed.profileScreen,
              path: AppRoutes.profileScreen,
              builder: (context, state) => const ProfileScreen(),
              routes: [
                GoRoute(
                    name: AppRoutesNamed.userInformationsScreen,
                    path: AppRoutes.userInformationsScreen,
                    builder: (context, state) => const UserInformationsScreen(),

                ),
              ]
            ),
          ],
        ),

        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //         name: AppRoutesNamed.servicesScreen,
        //         path: AppRoutes.servicesScreen,
        //         builder: (context, state) => ServicesScreen(),
        //         routes: [
        //           GoRoute(
        //             path: AppRoutes.sendTechIssueScreen,
        //             name: AppRoutesNamed.sendTechIssueScreen,
        //             builder: (context, state) => SendTechIssueScreen(),
        //           ),
        //           GoRoute(
        //             path: AppRoutes.sendComplaintsScreen,
        //             name: AppRoutesNamed.sendComplaintsScreen,
        //             builder: (context, state) => SendComplaintsScreen(),
        //           ),
        //           GoRoute(
        //             path: AppRoutes.inAndOutScreen,
        //             name: AppRoutesNamed.inAndOutScreen,
        //             builder: (context, state) => InAndOutScreen(),
        //           ),
        //           GoRoute(
        //             path: AppRoutes.healthyInsuranceScreen,
        //             name: AppRoutesNamed.healthyInsuranceScreen,
        //             builder: (context, state) => HealthyInsuranceScreen(),
        //           ),
        //           GoRoute(
        //             path: AppRoutes.allSurveysScreen,
        //             name: AppRoutesNamed.allSurveysScreen,
        //             builder: (context, state) => AllSurveysScreen(),
        //           ),
        //           GoRoute(
        //             path: AppRoutes.qualityScreen,
        //             name: AppRoutesNamed.qualityScreen,
        //             builder: (context, state) => QualityScreen(),
        //           ),
        //           GoRoute(
        //             path: AppRoutes.myAllComplaintsAndTechCasesHistoryScreen,
        //             name: AppRoutesNamed.myAllComplaintsAndTechCasesHistoryScreen,
        //             builder: (context, state) => MyAllComplaintsAndTechCasesHistoryScreen(),
        //           ),
        //           GoRoute(
        //             path: AppRoutes.sendNotificationMessageScreen,
        //             name: AppRoutesNamed.sendNotificationMessageScreen,
        //             builder: (context, state) => SendNotificationScreen(),
        //           ),
        //         ]),
        //   ],
        // ),
        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //       name: AppRoutesNamed.profileScreen,
        //       path: AppRoutes.profileScreen,
        //       builder: (context, state) => const ProfileScreen(),
        //     ),
        //   ],
        // ),
      ],
    ),
  ],
);
