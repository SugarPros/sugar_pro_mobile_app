import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// An abstract class for local notification service
/// 
abstract class NotificationService {
  /// Get the instance from the notification package
  FlutterLocalNotificationsPlugin getNotificationInstance();

  /// initialise the plugin.
  void initNotifications();

  dynamic pendingNotificationRequests();

  /// Function to schedule a reminder at a specific time daily
  Future sendNotificationDaily({
    required int id,
    String? title,
    String? body,
  });

  /// Function to schedule reminder on a specific date but just once
  Future sendNotificationOnce(int id, String title, String body);

  /// This as the function name states, sets given properties to the notification.
  NotificationDetails getPlatformChannelSpecifics(int id);

  /// Configuration for IOS
  Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload);

  /// To navigate to a certain screen on click of notification from devices notification panel
  Future onSelectNotification(NotificationResponse? notificationResponse);

  /// Function to remove reminder, in the case where well, the data was deleted. So user won't receive notification still.
  void deleteNotification(int notificationId);
}