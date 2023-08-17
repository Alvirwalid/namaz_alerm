import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:namaz_time_shedule/feature/model/prayermodel.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


class Services extends GetxController {


  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  inItLocalNotification()async {
    var androidInitializationSetting =
        AndroidInitializationSettings("ic_launcher");
    var iosInitializationSetting = DarwinInitializationSettings();

    var initilizationSetting = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);

   await _flutterLocalNotificationsPlugin.initialize(initilizationSetting,
        onDidReceiveNotificationResponse: (payload) {});
  }

  Future<void> requestPermissions() async {


    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.requestPermission()??false;
    }
  }

  zoneSheduleTime({id, title, body, DateTime? dateTime}) async {
    // requestPermissions();
    tz.initializeTimeZones();


    // print(scheduledDate);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(  'your channel id', 'your channel name',
            channelDescription: 'your channel description');
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();
    //
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails


    );
    print([id,title,body, tz.TZDateTime.from(dateTime!, tz.local)]);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        '',
        body,
        tz.TZDateTime.from(dateTime, tz.local),
       notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }
}
