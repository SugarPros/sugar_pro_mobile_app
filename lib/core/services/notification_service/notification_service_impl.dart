import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sugar_pros/core/services/notification_service/notification_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class NotificationServiceImpl implements NotificationService {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationServiceImpl() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initNotifications();
  }

  @override
  FlutterLocalNotificationsPlugin getNotificationInstance() {
    return flutterLocalNotificationsPlugin;
  }

  @override
  void initNotifications() {
    // Sets icon to be displayed with notification (android).
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    // Intialization requires two arguments, for IOS and Android. IOS requires more , but that hasn't been set yet.
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
  }

  @override
  dynamic pendingNotificationRequests() async =>
      await flutterLocalNotificationsPlugin.pendingNotificationRequests();

  @override
  Future sendNotificationDaily({required int id, String? title, String? body}) async {
    // final Time time = Time(hour, minute);

    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.daily,
      getPlatformChannelSpecifics(id),
      androidScheduleMode: AndroidScheduleMode.exact,
    );

    log('Notification Succesfully Scheduled daily with id of $id');
  }

  @override
  Future sendNotificationOnce(int id, String title, String body) async {
    await flutterLocalNotificationsPlugin.show(id, title, body, getPlatformChannelSpecifics(id));

    log('Notification Succesfully Scheduled with id of $id');
  }

  @override
  NotificationDetails getPlatformChannelSpecifics(int id) {
    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '$id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    final DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails(
      threadIdentifier: 'TAJWay',
    );

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    return platformChannelSpecifics;
  }

  @override
  Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    return Future.value(1);
  }

  @override
  Future onSelectNotification(NotificationResponse? notificationResponse) async {
    log('Notification clicked');
    if (notificationResponse != null) {
      debugPrint('notification payload: ${notificationResponse.payload}');
    }
    // await Navigator.push(
    //   MyApp.navigatorKey.currentState.context,
    //   MaterialPageRoute(
    //       builder: (context) => RemindersView(payload: payload)),
    // );
  }

  @override
  void deleteNotification(int notificationId) {
    flutterLocalNotificationsPlugin.cancel(notificationId);
    log('Notfication with id: $notificationId been removed successfully');
  }
}
