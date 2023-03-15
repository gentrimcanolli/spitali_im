import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/main.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

class DoctorDetailsScreen extends StatefulWidget {
  String name;
  String department;
  String description;

  DoctorDetailsScreen({
    required this.name,
    required this.department,
    required this.description,
  });

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar("Dr. ${widget.name}", context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              doctorDetailsCard(
                name: "Dr. ${widget.name}",
                department: widget.department,
                details: widget.description,
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: primaryText(
                            text: "Working Time",
                            fontSize: 20.0,
                            fontColor: mainBlueColor(),
                            isBold: false),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          workingTime(weekDayName: "E hënë"),
                          const SizedBox(
                            width: 100.0,
                          ),
                          workingTime(weekDayName: "E premte"),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          workingTime(weekDayName: "E martë"),
                          const SizedBox(
                            width: 100.0,
                          ),
                          workingTime(weekDayName: "E shtunë"),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          workingTime(weekDayName: "E mërkurë"),
                          const SizedBox(
                            width: 100.0,
                          ),
                          workingTime(weekDayName: "E diel"),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      workingTime(weekDayName: "E enjte"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              primaryButton(
                text: "Rezervo Termin",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
