import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification{
  static Future initilize(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async{
    var androidInitilize = const AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings initializationSettingsDarwin =
    const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitilize, iOS: initializationSettingsDarwin);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    }

    static Future showBigTextNotification(
      {
      var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,

    })async{
      AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails(
        'you_can_name_it_whatever',
        'chanel_name',
        playSound: true,
        importance: Importance.max,
        priority: Priority.high,
      );
    const DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails(
      presentSound: false,
      );
    var not = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(0, title, body, not);
    }
}