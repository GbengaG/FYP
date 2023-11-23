import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/alarms.dart';
import 'package:flutter_application_3/widgets/constants.dart';
import 'package:flutter_application_3/widgets/notifi.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();
    notificationServices.initializeNotifications();
  }

  bool _isBool1 = false;
  bool _isBool2 = false;

  void state(Object? data) {
    if (data == "The sit is disturbed") {
      _isBool1 = true;
      setState(() {
        notificationServices.sendNotification("Title", "body");
      });
    }
  }

  void state2(Object? data) {
    if (data == "The bike is in danger") {
      _isBool2 = true;
      setState(() {
        notificationServices.sendNotification("Title", "body");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference movmentRef =
        FirebaseDatabase.instance.ref().child('Bike/sit');
    movmentRef.onChildChanged.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      state(data);
    });

    DatabaseReference movmentRef2 =
        FirebaseDatabase.instance.ref().child('Bike/movement');
    movmentRef2.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      state2(data);
    });

    NotificationServices notificationServices = NotificationServices();
    @override
    void initState() {
      super.initState();
      notificationServices.initializeNotifications();
    }

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
            height: 80,
            width: 73.48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Image(
                        image: AssetImage('assets/img2.jpg'),
                        fit: BoxFit.cover)),
              ],
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(50, 70, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                //first alarm state
                const Alerts(
                  solidColor: primaryColor,
                  argbColor: blueArgb,
                  customIcon: Icon(Icons.shield),
                  warning: 'Your bike is safe',
                ),
                const SizedBox(
                  height: 45,
                ),
                //second alarm state
                Alerts(
                  solidColor: yellowState,
                  argbColor: _isBool1 ? yellowArgbBlare : yellowArgb,
                  customIcon: Icon(Icons.shield),
                  warning: 'Contact with bike',
                ),

                const SizedBox(
                  height: 45,
                ),
                //third alarm state

                Alerts(
                  solidColor: redState,
                  argbColor: _isBool2 ? redArgbBlare : redArgb,
                  customIcon: Icon(Icons.shield),
                  warning: 'Bike about to be stolen,\n Hurry there now!"',
                ),

                const SizedBox(
                  height: 90,
                ),
                Center(
                  child: Card(
                    elevation: 10,
                    color: primaryColor,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Alarm()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Deactivate Alarm',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        letterSpacing: .5),
                                  )),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            )),
      ])),
    );
  }
}
