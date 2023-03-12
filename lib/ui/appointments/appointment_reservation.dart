import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

class AppointmentReservationScreen extends StatefulWidget {
  const AppointmentReservationScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentReservationScreen> createState() =>
      _AppointmentReservationScreenState();
}

class _AppointmentReservationScreenState
    extends State<AppointmentReservationScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: secondaryAppBar("Rezervo Termin", context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
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
                items: [
                  DropdownMenuItem(
                    child: Text("Kardiologji"),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
            SizedBox(
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
                items: [
                  DropdownMenuItem(
                    child: Text("Kardiologji"),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            profileTextView(
                text: "Nr. personal",
                isPassword: false,
                controller: controller),
            profileTextView(
                text: "Email", isPassword: false, controller: controller),
            profileTextView(
                text: "Nr. i telefonit",
                isPassword: false,
                controller: controller),
            messageTextView(messageBoxHeight: 150.0, controller: controller),
            primaryButton(text: "Rezervo", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
