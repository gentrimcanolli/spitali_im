import 'package:flutter/material.dart';
import 'package:spitali_im/ui/login/login.dart';
import 'package:spitali_im/ui/reusable_widgets/reusable_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6ebeb),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/spitali_im_logo.png",
              width: 250,
              height: 250,
            ),
            primaryText(
                text: "Spitali im",
                fontSize: 25.0,
                fontColor: const Color(0xff2d5e6c),
                isBold: true)
          ],
        ),
      ),
    );
  }
}
