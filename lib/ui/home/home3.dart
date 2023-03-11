import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/constants/fonts.dart';
import 'package:spitali_im/ui/login/login.dart';
import 'package:spitali_im/ui/register/register.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar("Profili", false),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "images/online_appointment.png",
              width: 400.0,
            ),
            Text(
              "Departamentet",
              style: TextStyle(
                fontFamily: kRoboto,
                fontSize: 25.0,
                color: mainBlueColor(),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      departmentCard(
                        imagePath: "images/heart_icon.png",
                        text: "Kardiologji",
                      ),
                      departmentCard(
                        imagePath: "images/lungs_icon.png",
                        text: "Pulmologji",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      departmentCard(
                        imagePath: "images/brain_icon.png",
                        text: "Neurologji",
                      ),
                      departmentCard(
                        imagePath: "images/kidney_icon.png",
                        text: "Nefrologji",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      departmentCard(
                        imagePath: "images/brain_icon.png",
                        text: "Neurologji",
                      ),
                      departmentCard(
                        imagePath: "images/kidney_icon.png",
                        text: "Nefrologji",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
