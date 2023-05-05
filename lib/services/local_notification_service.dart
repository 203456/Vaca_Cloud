import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterNotificationPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterNotificationPlugin.initialize(initializationSettings);
}

Future<void> showNotification(id, nombreAnimal) async {
  const bodyNotification = 'Cita de ';
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('0', 'canal');
  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterNotificationPlugin.show(
      id, 'Recordatorio', bodyNotification+nombreAnimal, notificationDetails);
}
