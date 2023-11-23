import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterNotifi =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInit =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  void initializeNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInit,
    );

    await _flutterNotifi.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterNotifi.show(0, title, body, notificationDetails,
        payload: "New Notification");
  }
}
