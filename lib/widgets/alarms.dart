import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/notifi.dart';
import 'package:get/get.dart';

class Alarm extends StatefulWidget {
  final data = RxString('');
  Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();
    notificationServices.initializeNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Testing testing!"),
          onPressed: () {
            notificationServices.sendNotification("Title", "body");
          },
        ),
      ),
    );
  }
}
