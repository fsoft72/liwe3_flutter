import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../utils/debug.dart';

// Create an instance of FlutterLocalNotificationsPlugin
final FlutterLocalNotificationsPlugin localNotif = FlutterLocalNotificationsPlugin();

// This callback set all the settings for FlutterLocalNotificationsPlugin
Future<void> notificationInit(InitializationSettings initSettings) async {
  await localNotif.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (NotificationResponse resp) async {
      // Get the payload from the notification response
      final payload = resp.payload;
      // Navigate to the NotificationDetailsPage if payload exists
      if (payload != null) {
        // Get.to(() => NotificationDetailsPage(payload: payload));
      }
    },
  );
}

Future<void> showNotification(
  RemoteMessage message, {
  bool notificationOpened = false,
  bool isLocal = false,
  bool isBackground = false,
}) {
  if (message.notification == null) return Future.value();

  // Encode the message payload
  final payload = {
    'hash': message.hashCode,
    'title': message.notification?.title ?? 'Notification',
    'body': message.notification?.body ?? '',
  };

  try {
    // Show a local notification
    localNotif.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      payload: jsonEncode(payload),
    );

    if (notificationOpened) {
      // Navigate to the NotificationDetailsPage
      // Get.offAll(() => NotificationDetailsPage(payload: jsonEncode(payload)));
    }
  } catch (e) {
    zprint('Error showing notification: $e');
  }

  return Future.value();
}
