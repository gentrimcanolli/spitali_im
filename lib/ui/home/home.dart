import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/constants/fonts.dart';
import 'package:spitali_im/ui/home/department_details.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar("Ballina", false),
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
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigateToDepartment(
                              "kardiologji", "images/heart_icon.png");
                        },
                        child: departmentCard(
                          imagePath: "images/heart_icon.png",
                          text: "Kardiologji",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateToDepartment(
                              "pulmologji", "images/lungs_icon.png");
                        },
                        child: departmentCard(
                          imagePath: "images/lungs_icon.png",
                          text: "Pulmologji",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigateToDepartment(
                              "neurologji", "images/brain_icon.png");
                        },
                        child: departmentCard(
                          imagePath: "images/brain_icon.png",
                          text: "Neurologji",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateToDepartment(
                              "nefrologji", "images/kidney_icon.png");
                        },
                        child: departmentCard(
                          imagePath: "images/kidney_icon.png",
                          text: "Nefrologji",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigateToDepartment(
                              "neurologji", "images/bran_icon.png");
                        },
                        child: departmentCard(
                          imagePath: "images/brain_icon.png",
                          text: "Neurologji",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateToDepartment(
                              "nefrologji", "images/kidney_icon.png");
                        },
                        child: departmentCard(
                          imagePath: "images/kidney_icon.png",
                          text: "Nefrologji",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
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

  navigateToDepartment(String departmentId, String imagePath) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DepartmentDetailsScreen(
          departmentId: departmentId,
          imagePath: imagePath,
        ),
      ),
    );
  }
}
