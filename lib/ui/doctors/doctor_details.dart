import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/main.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: secondaryAppBar("Dr. Gentrim Canolli", context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              doctorDetailsCard(
                  name: "Dr. Gentrim Canolli",
                  department: "Kardiologji",
                  details:
                      "Kardiolog me përvojë në diagnostikimin dhe trajtimin e sëmundjeve të zemrës dhe të sistemit të qarkullimit të gjakut. Duke u përqendruar në pacientët e mi, unë punoj për të siguruar që ata të marrin trajtimin më të mirë dhe të personalizuar për nevojat e tyre."),
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
