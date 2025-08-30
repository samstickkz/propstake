import 'dart:convert';
import 'dart:io';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/app_logger.dart';
import '../../../utils/constants.dart';
import '../../cache/database_keys.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async{


  NotificationService.handleMessage(message);
}

class NotificationService{

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future initialize() async {
    PermissionStatus status = await Permission.notification.request();
    if(!status.isGranted){
      if(Platform.isIOS && kDebugMode){}else{
        await openAppSettings();
      }
    }else{
      if(Platform.isIOS){
        AppLogger.debug("Its ios");
        var res = await FirebaseMessaging.instance.getAPNSToken();
        if(res!=null){
          var response  = await FirebaseMessaging.instance.getToken();
          // print("FCM Token: $response");

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
          // print("FCM Token (Android): $response");

          await storageService.storeItem(key: StorageKey.fcmToken);
        }else{
          AppLogger.debug("NO FCM TOKEN");
        }
      }
    }

    bool isAllowed =  await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
        critical: false
    )?? false;
    // print("Is notification allowed::: $isAllowed");

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
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      // print("Tapped");
    });

    // FirebaseMessaging.onMessageOpenedApp

  }


  static handleMessage(RemoteMessage? message){
    if (message!=null){
      try{
        showBigTextNotification(title: "${message.notification?.title}", body: "${message.notification?.body}", payload: jsonEncode(message.data));
      }catch(err){
        debugPrint(err.toString());
      }
    }
  }

  static Future showBigTextNotification({var id =0,required String title, required String body,
    String? payload
  } ) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    const  AndroidNotificationDetails(
      'prop', // id
      'prop', // title
      channelDescription: "prop",
      playSound: true,
      icon: 'mipmap/ic_launcher',
      sound: RawResourceAndroidNotificationSound('sound'),
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