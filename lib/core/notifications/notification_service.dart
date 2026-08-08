import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_navigation.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('FCM background: ${message.messageId}');
}

class NotificationService {
  NotificationService({
    FirebaseMessaging? messaging,
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _messaging = messaging ?? FirebaseMessaging.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  final FirebaseMessaging _messaging;
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const _channel = AndroidNotificationChannel(
    'important_events',
    'Eventos importantes',
    description: 'Movimientos y eventos importantes de tu cuenta.',
    importance: Importance.high,
  );

  Future<void> initialize() async {
    const android = AndroidInitializationSettings('ic_notification');
    const darwin = DarwinInitializationSettings();
    await _localNotifications.initialize(
      settings: const InitializationSettings(android: android, iOS: darwin),
      onDidReceiveNotificationResponse: (response) {
        NotificationNavigation.handlePayload(response.payload);
      },
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    final settings = await _messaging.requestPermission(
        alert: true, badge: true, sound: true);
    debugPrint('Permiso FCM: ${settings.authorizationStatus}');
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen(_showForegroundNotification);
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('FCM tap background data: ${message.data}');
      NotificationNavigation.handleData(message.data);
    });
    _messaging.onTokenRefresh.listen(_saveToken);

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      debugPrint('FCM tap terminated data: ${initialMessage.data}');
      NotificationNavigation.handleData(initialMessage.data);
    }

    if (_auth.currentUser != null) {
      final token = await _messaging.getToken();
      if (token != null) await _saveToken(token);
    }
  }

  Future<void> registerCurrentDevice() async {
    final token = await _messaging.getToken();
    if (token != null) await _saveToken(token);
  }

  Future<void> unregisterCurrentDevice() async {
    final user = _auth.currentUser;
    final token = await _messaging.getToken();
    if (user == null || token == null) return;
    await _deviceDocument(user.uid, token).delete();
  }

  Future<void> _saveToken(String token) async {
    final user = _auth.currentUser;
    if (user == null) return;
    await _deviceDocument(user.uid, token).set({
      'token': token,
      'platform': _platformName,
      'enabled': true,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  DocumentReference<Map<String, dynamic>> _deviceDocument(
    String uid,
    String token,
  ) {
    final safeId = token.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('devices')
        .doc(safeId);
  }

  Future<void> _showForegroundNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null && message.data.isEmpty) return;
    await _localNotifications.show(
      id: message.messageId.hashCode,
      title: notification?.title ?? message.data['title'] ?? 'Nuevo evento',
      body: notification?.body ??
          message.data['body'] ??
          'Tienes una actualización importante.',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'important_events',
          'Eventos importantes',
          channelDescription: 'Movimientos y eventos importantes de tu cuenta.',
          importance: Importance.high,
          priority: Priority.high,
          icon: 'ic_notification',
        ),
        iOS: DarwinNotificationDetails(),
      ),
      payload: jsonEncode(message.data),
    );
  }

  String get _platformName {
    if (const bool.fromEnvironment('dart.library.html')) return 'web';
    return 'mobile';
  }
}
