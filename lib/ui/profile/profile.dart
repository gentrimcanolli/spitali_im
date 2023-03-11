import 'package:flutter/material.dart';
import 'package:spitali_im/constants/colors.dart';
import 'package:spitali_im/constants/fonts.dart';
import 'package:spitali_im/ui/login/login.dart';
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
      appBar: primaryAppBar("Profili", true),
      body: Center(
        child: Column(
          children: [
            primaryText(
                text: "Emri",
                fontSize: 20.0,
                fontColor: mainBlueColor(),
                isBold: false),
            primaryTextField("Gentrim Canolli", false, controller)
          ],
        ),
      ),
    );
  }
}
