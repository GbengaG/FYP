import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: constant_identifier_names
const String api_key = "API_KEY";
const Color primaryColor = Color(0xff0A5EDC);
const Color blueArgb = Color.fromARGB(255, 73, 99, 145);
const Color yellowState = Color(0xFFEEDB00);
const Color yellowArgb = Color.fromARGB(255, 243, 241, 221);
const Color yellowArgbBlare = Color.fromARGB(255, 240, 243, 89);
const Color redState = Color(0xFFE53217);
const Color redArgb = Color.fromARGB(255, 235, 224, 222);
const Color redArgbBlare = Color(0xFFE53217);

class Alerts extends StatelessWidget {
  final Color solidColor;
  final Color argbColor;
  final String warning;
  final Widget customIcon;
  const Alerts(
      {super.key,
      required this.solidColor,
      required this.argbColor,
      required this.customIcon,
      required this.warning});

  @override
  Widget build(BuildContext context) {
    var style1 =
        GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.normal);

    return Row(
      children: [
        Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: solidColor,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(5),
              topEnd: Radius.circular(5),
              bottomStart: Radius.circular(6),
              bottomEnd: Radius.circular(6),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Container(
              height: 100,
              width: 290,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: argbColor,
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.zero,
                  topEnd: Radius.circular(5),
                  bottomStart: Radius.zero,
                  bottomEnd: Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: solidColor,
                      ),
                      child: customIcon,
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    Text(warning, style: style1)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
