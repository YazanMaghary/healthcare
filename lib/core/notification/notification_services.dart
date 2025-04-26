// import 'dart:io';

// import 'package:android_intent_plus/android_intent.dart';
// import 'package:android_intent_plus/flag.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:permission_handler/permission_handler.dart';

// class NotificationServices {
//   final notificationPlugin = FlutterLocalNotificationsPlugin();
//   final bool _isInitilized = false;
//   bool get isInitilized => _isInitilized;
//   Future<void> initNotification() async {
//     if (_isInitilized) {}
//     if (Platform.isAndroid) {
//       var status = await Permission.notification.status;
//       if (!status.isGranted) {
//         await Permission.notification.request();
//       }
//     }
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/launcher_icon');
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );
//     await notificationPlugin.initialize(initializationSettings);
//   }

//   NotificationDetails notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails("upcoming", "upcoming appointment",
//             channelDescription: "Latest upcoming appointmnet",
//             importance: Importance.max,
//             priority: Priority.high));
//   }

//   Future<void> openExactAlarmSettings() async {
//     const intent = AndroidIntent(
//       action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
//       flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
//     );

//     await intent.launch();
//   }

//   Future<void> showNotification(
//       {required int id, String? title, String? body}) async {
//     return await notificationPlugin
//         .show(
//       id,
//       title,
//       body,
//       notificationDetails(),
//     )
//         .catchError((e) async {
//       await openExactAlarmSettings();
//     });
//   }
// }
