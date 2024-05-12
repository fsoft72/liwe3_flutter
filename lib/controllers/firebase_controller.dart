import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late Function(RemoteMessage message) _showNotification;
late FirebaseOptions _firebaseOptions;

class LiWEFirebaseController extends GetxController {
  late Future<void> notificationInit;
  late Future<void> showNotification;

  Future<void> initialize({
    required notificationInit,
    required showNotification,
    required options, // Firebase Options
  }) async {
    // Initialize Firebase with the default options
    await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      options: options,
    );

    _firebaseOptions = options;
    _showNotification = showNotification;

    // Get an instance of FirebaseMessaging
    final messaging = FirebaseMessaging.instance;

    await _requestPermissions(messaging);
    await _registerToken(messaging);
    await _initSettings(notificationInit);

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Print message details in debug mode
      if (kDebugMode) {
        print('=== Handling a foreground message: ${message.messageId}');
      }

      showNotification(message);
    });

    // Seup the background message handler, using the backgroundHandler function
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    // Listen for messages that open the app from a terminated state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      showNotification(message, notificationOpened: true);
    });

    // Check if the app was opened from a notification
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) await showNotification(initialMessage, notificationOpened: true);
  }
}

Future<void> _registerToken(messaging) async {
  // Get the FCM token
  String? token = await messaging.getToken();

  // Save the token to Firestore if it exists
  if (token != null) await FirebaseFirestore.instance.collection('token_lists').doc(token).set({'token': token});

  // Print the token in debug mode
  if (kDebugMode) {
    print('=== Registration Token=$token');
  }
}

Future<InitializationSettings> _initSettings(notificationInit) async {
  // Set up Android notification settings
  const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

  // Set up iOS notification settings
  DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (id, title, body, payload) => null,
  );

  // Combine Android and iOS notification settings
  InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await notificationInit(initSettings);

  return initSettings;
}

Future<NotificationSettings> _requestPermissions(messaging) async {
  // Request permission for notifications
  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  // Print the permission status in debug mode
  if (kDebugMode) {
    print('=== Permission granted: ${settings.authorizationStatus}');
  }

  return settings;
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  // Print message details in debug mode
  if (kDebugMode) {
    print('=== Handling a background message: ${message.messageId}');
  }

  // Initialize Firebase with the default options
  try {
    await Firebase.initializeApp(options: _firebaseOptions);

    // Now that Firebase is initialized, call showNotification
    await _showNotification(message);
  } catch (e) {
    // Handle potential errors during Firebase initialization
    print("Error initializing Firebase: $e");
  }

  return Future<void>.value();
}
