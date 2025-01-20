import 'package:cash_toggar_app/helper/routing/router_observer.dart';
import 'package:cash_toggar_app/modules/authentication/signin/view/signin_screen.dart';
import 'package:cash_toggar_app/modules/authentication/signup/view/sign_up_screen.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/home/view/home_screen.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/profile/view/profile_screen.dart';
import 'package:cash_toggar_app/modules/bottom_nav_modules/transactions/view/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // initialLocation: AppRoutes.servicesScreen,
  observers: [
    MyRouterObserver(),
  ],
  routes: [
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
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesNamed.homeScreen,
              path: AppRoutes.homeScreen,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesNamed.transactionScreen,
              path: AppRoutes.transactionScreen,
              builder: (context, state) => const TransactionScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutesNamed.profileScreen,
              path: AppRoutes.profileScreen,
              builder: (context, state) => const ProfileScreen(),
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
