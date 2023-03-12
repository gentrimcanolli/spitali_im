import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/constants/fonts.dart';
import 'package:spitali_im/ui/login/login.dart';
import 'package:spitali_im/ui/profile/complaint.dart';
import 'package:spitali_im/ui/register/register.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: primaryAppBar("Profili", true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              profileTextView(
                  text: "Emri", isPassword: false, controller: controller),
              profileTextView(
                  text: "Nr. personal",
                  isPassword: false,
                  controller: controller),
              profileTextView(
                  text: "Email", isPassword: false, controller: controller),
              profileTextView(
                  text: "Fjalëkalimi",
                  isPassword: true,
                  controller: controller),
              primaryButton(text: "Përditëso profilin", onTap: () {}),
              SizedBox(height: 20.0),
              secondaryButton(
                  text: "Ankesë",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => ComplaintScreen(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
