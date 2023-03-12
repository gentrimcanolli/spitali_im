import 'package:flutter/material.dart';
import 'package:spitali_im/ui/appointments/appointment_reservation.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: primaryAppBar("Terminet", false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              shadowColor: shadowColor(),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "images/doctor_profile.jpg",
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            primaryText(
                              text: "Dr. Gentrim Canolli",
                              fontSize: 20.0,
                              fontColor: mainBlueColor(),
                              isBold: false,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 25.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              decoration: BoxDecoration(
                                color: mainBlueColor(),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Kardiolog",
                                  style: TextStyle(
                                    fontFamily: kRoboto,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        workingTime(weekDayName: "E diel"),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    secondaryButton(
                      text: "Anulo",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: primaryButton(
                  text: "Rezervo Termin",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => AppointmentReservationScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
