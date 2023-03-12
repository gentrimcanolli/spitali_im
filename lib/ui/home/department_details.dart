import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

class DepartmentDetailsScreen extends StatefulWidget {
  const DepartmentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentDetailsScreen> createState() =>
      _DepartmentDetailsScreenState();
}

class _DepartmentDetailsScreenState extends State<DepartmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: secondaryAppBar("Departamentet", context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                "images/heart_icon.png",
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 400.0,
                child: Card(
                  shadowColor: shadowColor(),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 30.0),
                    child: Column(
                      children: [
                        primaryText(
                            text: "Kardiologji",
                            fontSize: 23.0,
                            fontColor: mainBlueColor(),
                            isBold: true),
                        SizedBox(
                          height: 20.0,
                        ),
                        primaryText(
                            text:
                                "Kardiologjia është degë e mjekësisë që merret me diagnostikimin, trajtimin dhe parandalimin e sëmundjeve të zemrës dhe të sistemit të qarkullimit të gjakut. Kardiologët janë specialistë të trajtimit të sëmundjeve të zemrës, duke përfshirë infarktin e miokardit, aritmive, insuficiencën kardiake, si dhe sëmundjet e enëve të gjakut që furnizojnë zemrën me gjak.",
                            fontSize: 22.0,
                            fontColor: textColor(),
                            isBold: false),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              primaryButton(text: "Doktorët", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
