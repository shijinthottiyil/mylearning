import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

///Top-Level Function for handling background Notifications.<--App is Terminated--->
///
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  if (kDebugMode) {
    print('Title = ${message.notification?.title}');
    print('Body = ${message.notification?.body}');
    print('Payload = ${message.data}');
  }
}

///Class For Handling Firebase Notification Logic.
///
class PushNotifications {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();

    if (kDebugMode) {
      print('FCM TOKEN = $fCMToken');
    }

    ///To receive notifications in the background.
    ///
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
