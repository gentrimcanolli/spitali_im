import 'package:flutter/material.dart';
import 'package:spitali_im/ui/register/register.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _personalNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar("Kyçu", false),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
        child: Column(
          children: [
            Image.asset(
              "images/login_logo.jpg",
            ),
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 50.0,
              child: primaryTextField(
                  "Nr. personal", false, _personalNoController),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 50.0,
              child: primaryTextField("Fjalëkalimi", true, _passwordController),
            ),
            SizedBox(
              height: 25.0,
            ),
            mainButton(
              text: "Kyçu",
              onTap: () {},
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nuk keni profil akoma? ",
                  style: TextStyle(
                    color: mainGrayColor(),
                    fontFamily: kRoboto,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => Register(),
                      ),
                    );
                  },
                  child: Text(
                    "Regjistrohuni",
                    style: TextStyle(
                      color: mainBlueColor(),
                      fontFamily: kRoboto,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
