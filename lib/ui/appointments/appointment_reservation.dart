import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';
import '../../data/database/appointment_helper.dart';
import '../../data/models/appointment_model.dart';

class AppointmentReservationScreen extends StatefulWidget {
  const AppointmentReservationScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentReservationScreen> createState() =>
      _AppointmentReservationScreenState();
}

class _AppointmentReservationScreenState
    extends State<AppointmentReservationScreen> {
  final TextEditingController _personalNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  AppointmentHelper appointmentHelper = AppointmentHelper();

  String departmentId = "Kardiologji";
  String doctorId = "Gentrim Canolli";
  DateTime? dateTime;

  selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then(
      (value) => {
        if (value != null)
          {
            setState(() {
              dateTime = value;
            })
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar("Rezervo Termin", context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                elevation: 5,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
                child: DropdownButtonFormField(
                  value: departmentId,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: mainBlueColor(),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      child: Text("Kardiologji"),
                      value: 'Kardiologji',
                    ),
                    DropdownMenuItem(
                      child: Text("Pulmologji"),
                      value: 'Pulmologji',
                    ),
                    DropdownMenuItem(
                      child: Text("Neurologji"),
                      value: 'Neurologji',
                    ),
                    DropdownMenuItem(
                      child: Text("Nefrologji"),
                      value: 'Nefrologji',
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      departmentId = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Material(
                elevation: 5,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
                child: DropdownButtonFormField(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: mainBlueColor(),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  value: doctorId,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Gentrim Canolli"),
                      value: 'Gentrim Canolli',
                    ),
                    DropdownMenuItem(
                      child: Text("Fatrion Sadiku"),
                      value: 'Fatrion Sadiku',
                    ),
                    DropdownMenuItem(
                      child: Text("Arian Mehana"),
                      value: 'Arian Mehana',
                    ),
                    DropdownMenuItem(
                      child: Text("Emanuel Nov"),
                      value: 'Emanuel Nov',
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      doctorId = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              profileTextView(
                text: "Nr. personal",
                isPassword: false,
                controller: _personalNoController,
                isEnabled: true,
              ),
              profileTextView(
                text: "Email",
                isPassword: false,
                controller: _emailController,
                isEnabled: true,
              ),
              profileTextView(
                text: "Nr. i telefonit",
                isPassword: false,
                controller: _phoneNoController,
                isEnabled: true,
              ),
              GestureDetector(
                onTap: selectDate,
                child: profileTextView(
                  text: "Data",
                  isPassword: false,
                  controller: _dateController,
                  isEnabled: false,
                  labelText: dateTime == null
                      ? ""
                      : dateTime.toString().substring(0, 10),
                ),
              ),
              profileTextView(
                text: "Koha",
                isPassword: false,
                controller: _timeController,
                isEnabled: true,
              ),
              primaryButton(
                text: "Rezervo",
                onTap: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: "Termin",
                    text: "A jeni të sigurt që dëshironi të rezervoni termin?",
                    confirmBtnText: "Po",
                    cancelBtnText: "Anulo",
                    onConfirmBtnTap: () {
                      appointmentHelper
                          .bookAppointment(
                        AppointmentModel(
                          date: dateTime.toString().substring(0, 10),
                          time: _timeController.text.toString(),
                          department: departmentId,
                          doctor: doctorId,
                          patient: _personalNoController.text.toString(),
                        ),
                      )
                          .then(
                        (_) {
                          setState(() {});
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
