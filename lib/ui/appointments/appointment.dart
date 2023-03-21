import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:spitali_im/ui/appointments/appointment_reservation.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../data/database/db_helper.dart';
import '../../data/models/appointment_model.dart';

class AppointmentScreen extends StatefulWidget {
  String patientId;

  AppointmentScreen({
    required this.patientId,
  });

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DBHelper dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar("Terminet", false, context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => AppointmentReservationScreen(),
            ),
          );
        },
        backgroundColor: mainBlueColor(),
        child: const Icon(
          Icons.insert_invitation_outlined,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
            future: dbHelper.getAppointments(widget.patientId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data != null) {
                List<AppointmentModel> appointmentList = snapshot.data!;
                return ListView.builder(
                  itemCount: appointmentList.length,
                  itemBuilder: (context, int index) {
                    AppointmentModel appointmentModel = appointmentList[index];
                    return Column(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        primaryText(
                                          text: appointmentModel.doctor,
                                          fontSize: 20.0,
                                          fontColor: mainBlueColor(),
                                          isBold: false,
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          height: 25.0,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          decoration: BoxDecoration(
                                            color: mainBlueColor(),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              appointmentModel.department,
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
                                    workingTime(
                                      weekDayName: appointmentModel.date,
                                      time: appointmentModel.time,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                secondaryButton(
                                  text: "Anulo",
                                  onTap: () {
                                    QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.confirm,
                                        title: "Anulo terminin?",
                                        text:
                                            "A deshironi te anuloni kete termin",
                                        confirmBtnText: "Po",
                                        cancelBtnText: "Jo",
                                        onConfirmBtnTap: () {
                                          dbHelper
                                              .discardAppointment(
                                                  appointmentList,
                                                  appointmentList[index].time)
                                              .then((_) {
                                            setState(() {});
                                            Navigator.pop(context);
                                          });
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: primaryText(
                    text: "Ju nuk keni asnje termin ",
                    fontSize: 20.0,
                    fontColor: mainBlueColor(),
                    isBold: false,
                  ),
                );
              }
            }),
      ),
    );
  }
}
