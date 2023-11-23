import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/alert_page.dart';
import 'package:flutter_application_3/widgets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A5EDC),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                      color: primaryColor,
                      height: 200,
                      width: 200,
                      child: const Image(
                          image: AssetImage('assets/img1.jpg'),
                          fit: BoxFit.cover)),
                  Text('Bike Tracker',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            letterSpacing: .5),
                      )),
                  Text('              ...secure your bikes',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            letterSpacing: .5),
                      ))
                ],
              ),
              const SizedBox(
                height: 180,
              ),
              Card(
                elevation: 10,
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AlertPage()));
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('GET STARTED',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ))),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: primaryColor,
                              ))
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
