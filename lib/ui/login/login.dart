import 'package:flutter/material.dart';
import 'package:spitali_im/ui/register/register.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../data/database/login_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginHelper loginHelper = LoginHelper();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _personalNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar("Kyçu"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
          child: Column(
            children: [
              Image.asset(
                "images/login_logo.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200.0,
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                height: 50.0,
                child: primaryTextField("Nr. personal", false,
                    _personalNoController, TextInputType.number, 10),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 50.0,
                child: primaryTextField("Fjalëkalimi", true,
                    _passwordController, TextInputType.text, 100),
              ),
              const SizedBox(
                height: 25.0,
              ),
              primaryButton(
                text: "Kyçu",
                onTap: () async {
                  await loginHelper.loginUser(
                    context,
                    _personalNoController.text.toString(),
                    _passwordController.text.toString(),
                  );
                  //   .then((value) {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (ctx) => MainNavigation(
                  //       personalNo: _personalNoController.text.toString(),
                  //     ),
                  //   ),
                  // );
                  // });
                },
              ),
              const SizedBox(
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
                          builder: (ctx) => const RegisterScreen(),
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
      ),
    );
  }
}
