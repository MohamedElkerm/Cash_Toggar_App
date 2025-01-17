// import 'dart:math';
//
// import 'package:EELU/helper/global_vars.dart';
// import 'package:EELU/modules/news_details_from_notification/news_details_from_notification_screen.dart';
// import 'package:EELU/resources/colors_manager.dart';
// import 'package:EELU/resources/routes_manager.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// class NotificationsHelper {
//   static initNotificationsServices() async {
//     AwesomeNotifications().initialize(
//       // set the icon to null if you want to use the default app icon
//       // 'resource://drawable/app_icon',
//       'resource://drawable/launcher_icon',
//       [
//         NotificationChannel(
//           channelGroupKey: 'basic_channel_group',
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic tests',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//           importance: NotificationImportance.Max,
//           channelShowBadge: true,
//           playSound: true,
//           criticalAlerts: true,
//
//         )
//       ],
//       // Channel groups are only visual and are not required
//       channelGroups: [
//         NotificationChannelGroup(
//             channelGroupKey: 'basic_channel_group',
//             channelGroupName: 'Basic group')
//       ],
//       debug: true,
//     );
//     await AwesomeNotifications().isNotificationAllowed().then(
//       (isAllowed) async {
//         await AwesomeNotifications().requestPermissionToSendNotifications();
//       },
//     );
//     await AwesomeNotifications().setListeners(
//       onActionReceivedMethod: onActionReceivedMethod,
//       onNotificationCreatedMethod: onNotificationCreatedMethod,
//       onDismissActionReceivedMethod: onDismissActionReceivedMethod,
//       onNotificationDisplayedMethod: onNotificationDisplayedMethod,
//     );
//   }
//   static Future<void> onNotificationCreatedMethod(
//       ReceivedNotification receivedNotification) async {
//     debugPrint("onNotificationCreatedMethod");
//   }
//
//   static Future<void> onNotificationDisplayedMethod(
//       ReceivedNotification receivedNotification) async {
//     debugPrint("onNotificationDisplayedMethod");
//   }
//
//   static Future<void> onDismissActionReceivedMethod(
//       ReceivedAction receivedAction) async {
//     debugPrint("onDismissActionReceivedMethod");
//   }
//
//   static Future<void> onActionReceivedMethod(
//       ReceivedAction receivedAction) async {
//     debugPrint("onActionReceivedMethod");
//     final payload = receivedAction.payload ?? {};
//     if (payload["navigate"] == "true") {
//       if (payload["navigate_to"] == Routes.newsDetailsScreen) {
//         navigatorKey.currentState?.push(
//           MaterialPageRoute(
//             builder: (_) => NewsDetailsFromNotificationScreen(
//               id: payload["news_id"],
//             ),
//           ),
//         );
//       }
//     }
//   }
//
//   static createNotification({
//     required String title,
//     required String body,
//     required var id,
//     final String? summary,
//     final Map<String, String>? payload,
//     final NotificationLayout notificationLayout = NotificationLayout.Default,
//     final NotificationCategory? notificationCategory =
//         NotificationCategory.Recommendation,
//     final String? pic,
//     final List<NotificationActionButton>? actionsButton,
//     final bool schedule = false,
//     final int? interval,
//   }) {
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         backgroundColor: AppColors.primary_700_main,
//         id: randomID(),
//         channelKey: 'basic_channel',
//         title: title.toString(),
//         body: body.toString(),
//         notificationLayout: notificationLayout,
//         summary: summary,
//         category: notificationCategory,
//         payload: payload,
//         bigPicture: pic,
//       ),
//       actionButtons: actionsButton,
//
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
// int randomID(){
//   Random random = Random();
//   int id = random.nextInt(1000000);
//   return id;
// }