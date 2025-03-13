import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:propstake/data/cache/database_keys.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:propstake/utils/constants.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async{

  print("NOTIFICATION RECIEVED");

  NotificationService.handleMessage(message);
}

class NotificationService{

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future initialize() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
        critical: false
    );
    var androidInitialize = const AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSInitialize = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestCriticalPermission: true,
        requestSoundPermission: true,
        // onDidReceiveLocalNotification:
        //     (int id, String? title, String? body, String? payload) async {
        //   showBigTextNotification(title: "$title", body: "$body");
        // }
    );
    var initializationsSettings = InitializationSettings(
        android: androidInitialize,
        iOS: iOSInitialize
    );

    await flutterLocalNotificationsPlugin.initialize(initializationsSettings);

    FirebaseMessaging.onMessage.listen(handleMessage);
    Platform.isIOS? FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage): (){};
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    if(Platform.isIOS){
      AppLogger.debug("Its ios");
      var res = await FirebaseMessaging.instance.getAPNSToken();
      if(res!=null){
        var response  = await FirebaseMessaging.instance.getToken();
        if(response!=null){
          AppLogger.debug("FCM TOKEN:: $response");
          await storageService.storeItem(key: StorageKey.fcmToken);
        }else{
          AppLogger.debug("NO FCM TOKEN");
        }
      }else{
        AppLogger.debug("NO APN TOKEN");
      }
    }else {
      AppLogger.debug("Its Android");
      var response  = await FirebaseMessaging.instance.getToken();
      if(response!=null){
        AppLogger.debug("FCM TOKEN:: $response");
        await storageService.storeItem(key: StorageKey.fcmToken);
      }else{
        AppLogger.debug("NO FCM TOKEN");
      }
    }
  }

  static handleMessage(RemoteMessage? message){
    // print(jsonEncode(message?.notification));
    if (message!=null){
      showBigTextNotification(title: "${message.notification?.title}", body: "${message.notification?.body}");
    }
  }

  static Future showBigTextNotification({var id =0,required String title, required String body,
    var payload
  } ) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    const  AndroidNotificationDetails(
      'prostake', // id
      'prostake', // title
      channelDescription: "prostake",
      playSound: true,
      icon: 'mipmap/ic_launcher',
      sound: RawResourceAndroidNotificationSound('sounds'),
      importance: Importance.max,
      priority: Priority.high,
    );

    var not= NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: const DarwinNotificationDetails(
            interruptionLevel: InterruptionLevel.critical,
            presentAlert: true,
            presentBadge: true,
            presentBanner: true,
            presentList: true,
            presentSound: true,
            sound: 'default'
          // sound: 'sounds.wav'
        )
    );
    await flutterLocalNotificationsPlugin.show(0, title, body,not );
  }

}
