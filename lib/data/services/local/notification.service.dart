// import 'dart:io';
// import 'dart:ui';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// Future<void> handleBackgroundMessage(RemoteMessage message) async{
//
//   print("NOTIFICATION RECIEVED");
//
//   NotificationService.handleMessage(message);
// }
//
// class NotificationService{
//
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   static Future initialize() async {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//         alert: true,
//         badge: true,
//         sound: true,
//         provisional: false,
//         critical: false
//     );
//     var androidInitialize = const AndroidInitializationSettings('mipmap/ic_launcher');
//     var iOSInitialize = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestCriticalPermission: true,
//         requestSoundPermission: true,
//         onDidReceiveLocalNotification:
//             (int id, String? title, String? body, String? payload) async {
//           showBigTextNotification(title: "$title", body: "$body");
//         }
//     );
//     var initializationsSettings = InitializationSettings(
//         android: androidInitialize,
//         iOS: iOSInitialize
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
//
//     FirebaseMessaging.onMessage.listen(handleMessage);
//     Platform.isIOS? FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage): (){};
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true, // Required to display a heads up notification
//       badge: true,
//       sound: true,
//     );
//     // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     //   alert: true, // Required to display a heads up notification
//     //   badge: true,
//     //   sound: true,
//     // );
//   }
//
//   // static initializeLocal() async {
//   //   FirebaseMessaging.onMessage.listen(handleMessage);
//   //   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   //   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//   //     alert: true, // Required to display a heads up notification
//   //     badge: true,
//   //     sound: true,
//   //   );
//   // }
//
//   static handleMessage(RemoteMessage? message){
//     // print(jsonEncode(message?.notification));
//     if (message!=null){
//       showBigTextNotification(title: "${message.notification?.title}", body: "${message.notification?.body}");
//     }
//   }
//
//   static Future showBigTextNotification({var id =0,required String title, required String body,
//     var payload
//   } ) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//     const  AndroidNotificationDetails(
//       'r4m', // id
//       'r4m', // title
//       channelDescription: "r4m",
//       playSound: true,
//       icon: 'mipmap/ic_launcher',
//       sound: RawResourceAndroidNotificationSound('sounds'),
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//     var not= NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: const DarwinNotificationDetails(
//             interruptionLevel: InterruptionLevel.critical,
//             presentAlert: true,
//             presentBadge: true,
//             presentBanner: true,
//             presentList: true,
//             presentSound: true,
//             sound: 'default'
//           // sound: 'sounds.wav'
//         )
//     );
//     await flutterLocalNotificationsPlugin.show(0, title, body,not );
//   }
//
// }
//